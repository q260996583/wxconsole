package com.jiuyv.yl.jms.client;

import java.util.UUID;

import com.fasterxml.uuid.EthernetAddress;
import com.fasterxml.uuid.Generators;
import com.fasterxml.uuid.impl.TimeBasedGenerator;

public class UUIDUtil {
	private static   EthernetAddress nic = EthernetAddress.fromInterface();
	// need to pass Ethernet address; can either use real one (shown here)
	public static  UUID getTimebaseUUID(){
	  // or bogus which would be gotten with: EthernetAddress.constructMulticastAddress()
	  TimeBasedGenerator uuidGenerator = Generators.timeBasedGenerator(nic);
	  // also: we don't specify synchronizer, getting an intra-JVM syncer; there is
	  // also external file-locking-based synchronizer if multiple JVMs run JUG
	  return uuidGenerator.generate();
	  }
}
