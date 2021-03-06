#include "WebSocketManager.h"

USING_NS_CC;
USING_NS_CC_EXT;

WebSocketManager* WebSocketManager::m_instance = NULL;

WebSocketManager::WebSocketManager()
	: m_wsiSendText(NULL)
{
	m_wsiSendText = new WebSocket();
	CCLog("begin socket connect");
	//if (!m_wsiSendText->init(*this, "ws://127.0.0.1:8080/websocket"))
	if (!m_wsiSendText->init(*this, "ws://127.0.0.1:2048/ws"))
	{
		CC_SAFE_DELETE(m_wsiSendText);
	}
}


WebSocketManager::~WebSocketManager()
{
	if (m_wsiSendText)
		m_wsiSendText->close();
}

WebSocketManager* WebSocketManager::instance()
{
	if (m_instance == NULL)
		m_instance = new WebSocketManager();
	return m_instance;
}

void WebSocketManager::onOpen(cocos2d::extension::WebSocket* ws){
	CCLog("Websocket (%p) opened",ws);
	if (ws == m_wsiSendText)
	{
		CCLog(" m_wsiSendText Websocket (%p) opened", ws);
		if (m_wsiSendText->getReadyState() == WebSocket::kStateOpen)
		{
			m_wsiSendText->send("Hello WebSocket, I'm a text message.");
			CCLog("send text");
		}
		else
		{
			std::string warningStr = "send text websocket instance wasn't ready...";
			CCLog("%s", warningStr.c_str());
		}
	}
}

void WebSocketManager::onMessage(cocos2d::extension::WebSocket* ws, const cocos2d::extension::WebSocket::Data& data){
	CCLog("Websocket (%p) onMessage", ws);
	std::string textStr = std::string("response text msg: ") + data.bytes + ", " ;
	CCLog("%s", textStr.c_str());
}

void WebSocketManager::onClose(cocos2d::extension::WebSocket* ws){
	CCLog("Websocket (%p) onClose", ws);
}
void WebSocketManager::onError(cocos2d::extension::WebSocket* ws, const cocos2d::extension::WebSocket::ErrorCode& error){
	CCLog("Websocket (%p) onError", ws);
	CCLog("Error was fired, error code: %d", error);
}