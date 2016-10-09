/*
 * Copyright 2012 The Netty Project
 *
 * The Netty Project licenses this file to you under the Apache License,
 * version 2.0 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at:
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */
package io.netty.example.http.websocketx.server;

import java.util.Locale;

import org.apache.log4j.Logger;
import org.x.ChannelManager;
import org.x.RoomManager;

import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketFrame;

/**
 * Echoes uppercase content of text frames.
 */
public class WebSocketFrameHandler extends SimpleChannelInboundHandler<WebSocketFrame> {

	private static final Logger LOG = Logger.getLogger(WebSocketFrameHandler.class);

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, WebSocketFrame frame) throws Exception {
		// ping and pong frames already handled

		if (frame instanceof TextWebSocketFrame) {
			// Send the uppercase string back.
			String request = ((TextWebSocketFrame) frame).text();
			LOG.info(ctx.channel() + "{} received {}" + request);
			if (checkLogin(request, ctx)) {
				ctx.channel().writeAndFlush(new TextWebSocketFrame(request.toUpperCase(Locale.US)));
			}
			if (!request.equals("login")) {
				if (RoomManager.channelRoomRalation.containsKey(ctx.channel().id().toString())) {
					String roomId = RoomManager.channelRoomRalation.get(ctx.channel().id().toString());
					if (RoomManager.rooms.containsKey(roomId)) {
						RoomManager.rooms.get(roomId).writeAndFlush(new TextWebSocketFrame(request.toUpperCase(Locale.US)));
					}
				}
			}
		} else {
			String message = "unsupported frame type: " + frame.getClass().getName();
			throw new UnsupportedOperationException(message);
		}
	}

	private boolean checkLogin(String request, ChannelHandlerContext ctx)
			throws NoSuchFieldException, IllegalAccessException {
		if (request.equals("login") && !isChannelInRoom(ctx)) {
			RoomManager.getInstance().enterRoom(ctx.channel());
		}
		return true;
	}

	private boolean isChannelInRoom(ChannelHandlerContext ctx) {
		boolean result = true;
		if (RoomManager.getInstance().channelRoomRalation.containsKey(ctx.channel().id().toString())) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception { // (5)
		System.out.println("Client:" + ctx.channel().remoteAddress() + " online " + ctx.channel() + " total:"
				+ ChannelManager.CHANNELS.size());
		LOG.debug("rooms.size:" + RoomManager.rooms.size());
	}

	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception { // (6)
		Channel incoming = ctx.channel();
		RoomManager.getInstance().leaveRoom(incoming);
		System.out.println("Client:" + incoming.remoteAddress() + " offline " + ctx.channel() + " total:"
				+ ChannelManager.CHANNELS.size());
		LOG.debug("rooms.size:" + RoomManager.rooms.size());
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		Channel incoming = ctx.channel();
		RoomManager.getInstance().leaveRoom(incoming);
		System.out.println("Client:" + incoming.remoteAddress() + " exception " + ctx.channel());
		// 当出现异常就关闭连接
		cause.printStackTrace();
		ctx.close();
		LOG.debug("rooms.size:" + RoomManager.rooms.size());
	}
}
