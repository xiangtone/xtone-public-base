package com.github.netty.http.handler;

import org.apache.log4j.Logger;

import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.channel.group.ChannelGroup;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.handler.codec.http.websocketx.WebSocketServerProtocolHandler;

public class TextWebSocketFrameHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

	private final ChannelGroup group;
	private static final Logger LOG = Logger.getLogger(TextWebSocketFrameHandler.class);

	public TextWebSocketFrameHandler(ChannelGroup group) {
		super();
		this.group = group;
	}

	@Override
	public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {

		LOG.debug(evt.toString());
		if (evt == WebSocketServerProtocolHandler.ServerHandshakeStateEvent.HANDSHAKE_COMPLETE) {
			ctx.pipeline().remove(HttpRequestHandler.class);
			// group.writeAndFlush(new TextWebSocketFrame("Client " + ctx.channel() +
			// " joined!"));
			group.add(ctx.channel());
		} else {
			super.userEventTriggered(ctx, evt);
		}

	}

	@Override
	protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
		LOG.debug(msg.text());
		group.writeAndFlush(msg.retain());
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		ctx.close();
		cause.printStackTrace();
	}
}
