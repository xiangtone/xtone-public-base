package org.x;

import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentSkipListMap;

import org.apache.log4j.Logger;
import org.common.util.ConfigManager;
import org.common.util.GenerateIdService;

import io.netty.channel.Channel;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;

public class RoomManager {

	private static final Logger LOG = Logger.getLogger(RoomManager.class);

	public static ConcurrentSkipListMap<String, ChannelGroup> rooms = new ConcurrentSkipListMap<String, ChannelGroup>();

	// key:channel.id value:room.id
	public static ConcurrentHashMap<String, String> channelRoomRalation = new ConcurrentHashMap<String, String>();

	private static RoomManager instance = new RoomManager();

	private RoomManager() {
	}

	static {
		getInstance();
	}

	public static RoomManager getInstance() {
		return instance;
	}

	public void enterRoom(Channel channel) throws NoSuchFieldException, IllegalAccessException {
		int roomSize = Integer.parseInt(
				ConfigManager.getConfigData("room.size") != null && ConfigManager.getConfigData("room.size").trim().length() > 0
						? ConfigManager.getConfigData("room.size") : "2");
		ChannelManager.CHANNELS.add(channel);
		// find last room
		if (rooms.size() > 0) {
			Entry<String, ChannelGroup> entry = rooms.lastEntry();
			if (entry.getValue().size() < roomSize) {
				entry.getValue().add(channel);
				channelRoomRalation.put(channel.id().toString(), entry.getKey());
			} else {
				createNewRoom(channel);
			}
		} else {
			createNewRoom(channel);
		}
		LOG.debug("current rooms.size:" + rooms.size());
	}

	private void createNewRoom(Channel channel) {
		ChannelGroup channelGroup = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);
		channelGroup.add(channel);
		String roomId = Long.toString(GenerateIdService.getInstance()
				.generateNew(Integer.parseInt(
						ConfigManager.getConfigData("server.id") != null && ConfigManager.getConfigData("server.id").length() > 0
								? ConfigManager.getConfigData("server.id") : "1"),
						"room.id", 1));
		rooms.put(roomId, channelGroup);
		channelRoomRalation.put(channel.id().toString(), roomId);
		LOG.debug("channelGroup.size:" + channelGroup.size());
	}

	public void leaveRoom(Channel channel) {
		ChannelManager.CHANNELS.remove(channel);
		if (channelRoomRalation.containsKey(channel.id().toString())) {
			// clean room
			if (rooms.containsKey(channelRoomRalation.get(channel.id().toString()))) {
				rooms.get(channelRoomRalation.get(channel.id().toString())).remove(channel);
				if (rooms.get(channelRoomRalation.get(channel.id().toString())).size() == 0) {
					rooms.remove(channelRoomRalation.get(channel.id().toString()));
				}
			}
			channelRoomRalation.remove(channel.id().toString());
		}
		LOG.debug("current rooms.size:" + rooms.size());
	}

}
