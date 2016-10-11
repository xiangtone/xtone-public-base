#ifndef __WebSocketManager_H__
#define __WebSocketManager_H__

#include "cocos2d.h"
#include "cocos-ext.h"
#include "WebSocket.h"

class WebSocketManager 
	: public cocos2d::extension::WebSocket::Delegate
{
public:
	~WebSocketManager();
	static WebSocketManager* instance();

	virtual void onOpen(cocos2d::extension::WebSocket* ws);
	virtual void onMessage(cocos2d::extension::WebSocket* ws, const cocos2d::extension::WebSocket::Data& data);
	virtual void onClose(cocos2d::extension::WebSocket* ws);
	virtual void onError(cocos2d::extension::WebSocket* ws, const cocos2d::extension::WebSocket::ErrorCode& error);

private:
	WebSocketManager();
	static WebSocketManager *m_instance;
	cocos2d::extension::WebSocket* m_wsiSendText;
};

#endif // __WebSocketManager_H__

