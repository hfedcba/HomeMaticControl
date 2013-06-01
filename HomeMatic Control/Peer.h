#ifndef PEER_H
#define PEER_H

#include <iomanip>
#include <string>
#include <iostream>
#include <sstream>
#include <unordered_map>
#include <memory>
#include <queue>

#include "XMLRPC/Device.h"
#include "HMDeviceTypes.h"

class BidCoSQueue;

class PairedPeer
{
public:
	int32_t address;
};

class XMLRPCConfigurationParameter
{
public:
	XMLRPCConfigurationParameter() {}
	XMLRPCConfigurationParameter(std::string serializedObject);
	virtual ~XMLRPCConfigurationParameter() {}

	XMLRPC::Parameter* xmlrpcParameter = nullptr;
	bool initialized = false;
	bool changed = false;
	int64_t value = 0;

	std::string serialize();
};

class Peer
{
    public:
		Peer() { pendingBidCoSQueues = shared_ptr<std::queue<shared_ptr<BidCoSQueue>>>(new std::queue<shared_ptr<BidCoSQueue>>()); }
		Peer(std::string serializedObject);
		virtual ~Peer() {}

        int32_t address = 0;
        std::string serialNumber = "";
        int32_t firmwareVersion = 0;
        int32_t remoteChannel = 0;
        int32_t localChannel = 0;
        HMDeviceTypes deviceType;
        uint8_t messageCounter = 0;
        std::unordered_map<int32_t, int32_t> config;
        std::unordered_map<int32_t, std::unordered_map<int32_t, std::unordered_map<double, XMLRPCConfigurationParameter>>> configCentral;
        XMLRPC::Device* xmlrpcDevice = nullptr;
        std::unordered_map<int32_t, std::vector<PairedPeer>> peers;
        std::unordered_map<int32_t, bool> peersReceived;
        //Has to be shared_ptr because Peer must be copyable
        shared_ptr<std::queue<shared_ptr<BidCoSQueue>>> pendingBidCoSQueues;

        std::string serialize();
        void initializeCentralConfig();
};

#endif // PEER_H
