# docker jmxtrans 
configuration can be passed overriding cmd or env variables,
## available ENV vars for configuration ( see source of runjmxtrans.sh for details): 


- FILENAME `default empty` , if configured run this file configuration instead of JSON_DIR files 
- JSON_DIR `default /var/lib/jmxtrans`

- LOG_DIR `default /var/log/jmxtrans`
- LOG_FILE `default /var/log/jmxtrans/jmxtrans.log`
- SECONDS_BETWEEN_RUNS `default 60`

- JAR_FILE `default /usr/share/jmxtrans/lib/jmxtrans-all.jar`
- JAVA_OPTS `default -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true`  
- HEAP_SIZE `default 512`    
- PERM_SIZE `default 384`  
- MAX_PERM_SIZE `default 384`  
- JMX_PORT `default 2101`  
- LOG_LEVEL `default debug`  
- CONTINUE_ON_ERROR `default false`  
- CONTINUE_ON_ERROR `default false`
- JAVAJDK_BIN  

## calculated by overridable ENVs
- GC_OPTS  
- MONITOR_OPTS  
- JMXTRANS_OPTS
  
 
 