LOCAL_PATH := $(call my-dir)

my_badvpn_C_INCLUDES := \
	$(LOCAL_PATH)/lwip/custom \
	$(LOCAL_PATH)/lwip/src/include/ipv4 \
	$(LOCAL_PATH)/lwip/src/include/ipv6 \
	$(LOCAL_PATH)/lwip/src/include

my_badvpn_CFLAGS := \
	-DBADVPN_THREADWORK_USE_PTHREAD -DBADVPN_LINUX -DBADVPN_BREACTOR_BADVPN \
	-D_GNU_SOURCE -DBADVPN_USE_SELFPIPE -DBADVPN_USE_EPOLL \
	-DBADVPN_LITTLE_ENDIAN -DBADVPN_THREAD_SAFE

my_badvpn_CFLAGS += \
	-std=gnu99 -Wno-unused-parameter -Wno-sign-compare

include $(CLEAR_VARS)

LOCAL_MODULE := libbadvpn
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
	base/BLog.c \
	base/BLog_syslog.c \
	base/BPending.c \
	base/DebugObject.c \
	flow/BufferWriter.c \
	flowextra/PacketPassInactivityMonitor.c \
	flow/PacketBuffer.c \
	flow/PacketPassConnector.c \
	flow/PacketPassFairQueue.c \
	flow/PacketPassInterface.c \
	flow/PacketProtoDecoder.c \
	flow/PacketProtoEncoder.c \
	flow/PacketProtoFlow.c \
	flow/PacketRecvInterface.c \
	flow/PacketStreamSender.c \
	flow/SinglePacketBuffer.c \
	flow/StreamPassInterface.c \
	flow/StreamRecvInterface.c \
	lwip/custom/sys.c \
	lwip/src/core/def.c \
	lwip/src/core/inet_chksum.c \
	lwip/src/core/init.c \
	lwip/src/core/ipv4/autoip.c \
	lwip/src/core/ipv4/icmp.c \
	lwip/src/core/ipv4/igmp.c \
	lwip/src/core/ipv4/ip4_addr.c \
	lwip/src/core/ipv4/ip4.c \
	lwip/src/core/ipv4/ip_frag.c \
	lwip/src/core/ipv6/dhcp6.c \
	lwip/src/core/ipv6/ethip6.c \
	lwip/src/core/ipv6/icmp6.c \
	lwip/src/core/ipv6/inet6.c \
	lwip/src/core/ipv6/ip6_addr.c \
	lwip/src/core/ipv6/ip6.c \
	lwip/src/core/ipv6/ip6_frag.c \
	lwip/src/core/ipv6/mld6.c \
	lwip/src/core/ipv6/nd6.c \
	lwip/src/core/mem.c \
	lwip/src/core/memp.c \
	lwip/src/core/netif.c \
	lwip/src/core/pbuf.c \
	lwip/src/core/stats.c \
	lwip/src/core/tcp.c \
	lwip/src/core/tcp_in.c \
	lwip/src/core/tcp_out.c \
	lwip/src/core/timers.c \
	lwip/src/core/udp.c \
	socksclient/BSocksClient.c \
	system/BConnection_common.c \
	system/BConnection_unix.c \
	system/BDatagram_unix.c \
	system/BNetwork.c \
	system/BReactor_badvpn.c \
	system/BSignal.c \
	system/BTime.c \
	system/BUnixSignal.c \
	tuntap/BTap.c \
	udpgw_client/UdpGwClient.c

LOCAL_C_INCLUDES := $(my_badvpn_C_INCLUDES)
LOCAL_CFLAGS := $(my_badvpn_CFLAGS)

include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := badvpn-tun2socks
LOCAL_MODULE_TAGS := optional
LOCAL_UNINSTALLABLE_MODULE := true

LOCAL_SRC_FILES := \
	tun2socks/SocksUdpGwClient.c \
	tun2socks/tun2socks.c

LOCAL_C_INCLUDES := $(my_badvpn_C_INCLUDES)
LOCAL_CFLAGS := $(my_badvpn_CFLAGS)
LOCAL_STATIC_LIBRARIES := libbadvpn

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := badvpn-udpgw
LOCAL_MODULE_TAGS := optional
LOCAL_UNINSTALLABLE_MODULE := true

LOCAL_SRC_FILES := \
	udpgw/udpgw.c

LOCAL_C_INCLUDES := $(my_badvpn_C_INCLUDES)
LOCAL_CFLAGS := $(my_badvpn_CFLAGS)
LOCAL_STATIC_LIBRARIES := libbadvpn

include $(BUILD_EXECUTABLE)
