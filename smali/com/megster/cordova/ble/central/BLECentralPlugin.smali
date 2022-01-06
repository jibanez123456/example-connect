.class public Lcom/megster/cordova/ble/central/BLECentralPlugin;
.super Lorg/apache/cordova/CordovaPlugin;
.source "BLECentralPlugin.java"

# interfaces
.implements Landroid/bluetooth/BluetoothAdapter$LeScanCallback;


# static fields
.field private static final ACCESS_COARSE_LOCATION:Ljava/lang/String; = "android.permission.ACCESS_COARSE_LOCATION"

.field private static final AUTOCONNECT:Ljava/lang/String; = "autoConnect"

.field private static final BONDED_DEVICES:Ljava/lang/String; = "bondedDevices"

.field private static final CONNECT:Ljava/lang/String; = "connect"

.field private static final DISCONNECT:Ljava/lang/String; = "disconnect"

.field private static final ENABLE:Ljava/lang/String; = "enable"

.field private static final IS_CONNECTED:Ljava/lang/String; = "isConnected"

.field private static final IS_ENABLED:Ljava/lang/String; = "isEnabled"

.field private static final LIST:Ljava/lang/String; = "list"

.field private static final READ:Ljava/lang/String; = "read"

.field private static final READ_RSSI:Ljava/lang/String; = "readRSSI"

.field private static final REFRESH_DEVICE_CACHE:Ljava/lang/String; = "refreshDeviceCache"

.field private static final REQUEST_ACCESS_COARSE_LOCATION:I = 0x2

.field private static final REQUEST_ENABLE_BLUETOOTH:I = 0x1

.field private static final REQUEST_MTU:Ljava/lang/String; = "requestMtu"

.field private static final SCAN:Ljava/lang/String; = "scan"

.field private static final SETTINGS:Ljava/lang/String; = "showBluetoothSettings"

.field private static final START_NOTIFICATION:Ljava/lang/String; = "startNotification"

.field private static final START_SCAN:Ljava/lang/String; = "startScan"

.field private static final START_SCAN_WITH_OPTIONS:Ljava/lang/String; = "startScanWithOptions"

.field private static final START_STATE_NOTIFICATIONS:Ljava/lang/String; = "startStateNotifications"

.field private static final STOP_NOTIFICATION:Ljava/lang/String; = "stopNotification"

.field private static final STOP_SCAN:Ljava/lang/String; = "stopScan"

.field private static final STOP_STATE_NOTIFICATIONS:Ljava/lang/String; = "stopStateNotifications"

.field private static final TAG:Ljava/lang/String; = "BLEPlugin"

.field private static final WRITE:Ljava/lang/String; = "write"

.field private static final WRITE_WITHOUT_RESPONSE:Ljava/lang/String; = "writeWithoutResponse"


# instance fields
.field bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

.field bluetoothStates:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field discoverCallback:Lorg/apache/cordova/CallbackContext;

.field private enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

.field peripherals:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/megster/cordova/ble/central/Peripheral;",
            ">;"
        }
    .end annotation
.end field

.field private permissionCallback:Lorg/apache/cordova/CallbackContext;

.field reportDuplicates:Z

.field private scanSeconds:I

.field private serviceUUIDs:[Ljava/util/UUID;

.field stateCallback:Lorg/apache/cordova/CallbackContext;

.field stateReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/apache/cordova/CordovaPlugin;-><init>()V

    .line 91
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    .line 94
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->reportDuplicates:Z

    .line 106
    new-instance v0, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;

    invoke-direct {v0, p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;-><init>(Lcom/megster/cordova/ble/central/BLECentralPlugin;)V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothStates:Ljava/util/Map;

    return-void
.end method

.method static synthetic access$000(Lcom/megster/cordova/ble/central/BLECentralPlugin;Landroid/content/Intent;)V
    .locals 0
    .param p0, "x0"    # Lcom/megster/cordova/ble/central/BLECentralPlugin;
    .param p1, "x1"    # Landroid/content/Intent;

    .prologue
    .line 47
    invoke-direct {p0, p1}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->onBluetoothStateChange(Landroid/content/Intent;)V

    return-void
.end method

.method private addStateListener()V
    .locals 5

    .prologue
    .line 356
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    if-nez v2, :cond_0

    .line 357
    new-instance v2, Lcom/megster/cordova/ble/central/BLECentralPlugin$2;

    invoke-direct {v2, p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin$2;-><init>(Lcom/megster/cordova/ble/central/BLECentralPlugin;)V

    iput-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    .line 366
    :cond_0
    :try_start_0
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 367
    .local v1, "intentFilter":Landroid/content/IntentFilter;
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 371
    .end local v1    # "intentFilter":Landroid/content/IntentFilter;
    :goto_0
    return-void

    .line 368
    :catch_0
    move-exception v0

    .line 369
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "BLEPlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error registering state receiver: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private autoConnect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 4
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;

    .prologue
    .line 402
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/megster/cordova/ble/central/Peripheral;

    .line 405
    .local v1, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-nez v1, :cond_0

    .line 406
    invoke-static {p2}, Landroid/bluetooth/BluetoothAdapter;->checkBluetoothAddress(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 407
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 408
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v1, Lcom/megster/cordova/ble/central/Peripheral;

    .end local v1    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    invoke-direct {v1, v0}, Lcom/megster/cordova/ble/central/Peripheral;-><init>(Landroid/bluetooth/BluetoothDevice;)V

    .line 409
    .restart local v1    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 416
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    :cond_0
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v1, p1, v2, v3}, Lcom/megster/cordova/ble/central/Peripheral;->connect(Lorg/apache/cordova/CallbackContext;Landroid/app/Activity;Z)V

    .line 418
    :goto_0
    return-void

    .line 411
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is not a valid MAC address."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private connect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 4
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;

    .prologue
    .line 386
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-static {p2}, Landroid/bluetooth/BluetoothAdapter;->checkBluetoothAddress(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 387
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v2, p2}, Landroid/bluetooth/BluetoothAdapter;->getRemoteDevice(Ljava/lang/String;)Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 388
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    new-instance v1, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-direct {v1, v0}, Lcom/megster/cordova/ble/central/Peripheral;-><init>(Landroid/bluetooth/BluetoothDevice;)V

    .line 389
    .local v1, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 392
    .end local v0    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v1    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    :cond_0
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/megster/cordova/ble/central/Peripheral;

    .line 393
    .restart local v1    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v1, :cond_1

    .line 394
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, p1, v2, v3}, Lcom/megster/cordova/ble/central/Peripheral;->connect(Lorg/apache/cordova/CallbackContext;Landroid/app/Activity;Z)V

    .line 399
    :goto_0
    return-void

    .line 396
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Peripheral "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private disconnect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 4
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;

    .prologue
    .line 422
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/megster/cordova/ble/central/Peripheral;

    .line 423
    .local v1, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v1, :cond_0

    .line 424
    invoke-virtual {v1}, Lcom/megster/cordova/ble/central/Peripheral;->disconnect()V

    .line 425
    invoke-virtual {p1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 432
    :goto_0
    return-void

    .line 427
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Peripheral "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 428
    .local v0, "message":Ljava/lang/String;
    const-string v2, "BLEPlugin"

    invoke-static {v2, v0}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V
    .locals 10
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUIDs"    # [Ljava/util/UUID;
    .param p3, "scanSeconds"    # I

    .prologue
    .line 554
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->locationServicesEnabled()Z

    move-result v6

    if-nez v6, :cond_0

    .line 555
    const-string v6, "Location Services are disabled"

    invoke-virtual {p1, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 610
    :goto_0
    return-void

    .line 559
    :cond_0
    const-string v6, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v6}, Lorg/apache/cordova/PermissionHelper;->hasPermission(Lorg/apache/cordova/CordovaPlugin;Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 561
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->permissionCallback:Lorg/apache/cordova/CallbackContext;

    .line 562
    iput-object p2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->serviceUUIDs:[Ljava/util/UUID;

    .line 563
    iput p3, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->scanSeconds:I

    .line 564
    const/4 v6, 0x2

    const-string v7, "android.permission.ACCESS_COARSE_LOCATION"

    invoke-static {p0, v6, v7}, Lorg/apache/cordova/PermissionHelper;->requestPermission(Lorg/apache/cordova/CordovaPlugin;ILjava/lang/String;)V

    goto :goto_0

    .line 569
    :cond_1
    iget-object v6, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6}, Landroid/bluetooth/BluetoothAdapter;->isDiscovering()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 570
    const-string v6, "BLEPlugin"

    const-string v7, "Tried to start scan while already running."

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    const-string v6, "Tried to start scan while already running."

    invoke-virtual {p1, v6}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 576
    :cond_2
    iget-object v6, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/megster/cordova/ble/central/Peripheral;>;>;"
    :cond_3
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 577
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 578
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/megster/cordova/ble/central/Peripheral;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/megster/cordova/ble/central/Peripheral;

    .line 579
    .local v1, "device":Lcom/megster/cordova/ble/central/Peripheral;
    invoke-virtual {v1}, Lcom/megster/cordova/ble/central/Peripheral;->isConnecting()Z

    move-result v0

    .line 580
    .local v0, "connecting":Z
    if-eqz v0, :cond_4

    .line 581
    const-string v6, "BLEPlugin"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Not removing connecting device: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lcom/megster/cordova/ble/central/Peripheral;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v8

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 583
    :cond_4
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v6

    if-nez v6, :cond_3

    if-nez v0, :cond_3

    .line 584
    invoke-interface {v4}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 588
    .end local v0    # "connecting":Z
    .end local v1    # "device":Lcom/megster/cordova/ble/central/Peripheral;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/megster/cordova/ble/central/Peripheral;>;"
    :cond_5
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->discoverCallback:Lorg/apache/cordova/CallbackContext;

    .line 590
    if-eqz p2, :cond_7

    array-length v6, p2

    if-lez v6, :cond_7

    .line 591
    iget-object v6, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6, p2, p0}, Landroid/bluetooth/BluetoothAdapter;->startLeScan([Ljava/util/UUID;Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Z

    .line 596
    :goto_2
    if-lez p3, :cond_6

    .line 597
    new-instance v3, Landroid/os/Handler;

    invoke-direct {v3}, Landroid/os/Handler;-><init>()V

    .line 598
    .local v3, "handler":Landroid/os/Handler;
    new-instance v6, Lcom/megster/cordova/ble/central/BLECentralPlugin$3;

    invoke-direct {v6, p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin$3;-><init>(Lcom/megster/cordova/ble/central/BLECentralPlugin;)V

    mul-int/lit16 v7, p3, 0x3e8

    int-to-long v8, v7

    invoke-virtual {v3, v6, v8, v9}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 607
    .end local v3    # "handler":Landroid/os/Handler;
    :cond_6
    new-instance v5, Lorg/apache/cordova/PluginResult;

    sget-object v6, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v5, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 608
    .local v5, "result":Lorg/apache/cordova/PluginResult;
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 609
    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto/16 :goto_0

    .line 593
    .end local v5    # "result":Lorg/apache/cordova/PluginResult;
    :cond_7
    iget-object v6, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v6, p0}, Landroid/bluetooth/BluetoothAdapter;->startLeScan(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)Z

    goto :goto_2
.end method

.method private getBondedDevices(Lorg/apache/cordova/CallbackContext;)V
    .locals 7
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 310
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 311
    .local v0, "bonded":Lorg/json/JSONArray;
    iget-object v5, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v5}, Landroid/bluetooth/BluetoothAdapter;->getBondedDevices()Ljava/util/Set;

    move-result-object v1

    .line 313
    .local v1, "bondedDevices":Ljava/util/Set;, "Ljava/util/Set<Landroid/bluetooth/BluetoothDevice;>;"
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/bluetooth/BluetoothDevice;

    .line 314
    .local v2, "device":Landroid/bluetooth/BluetoothDevice;
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getBondState()I

    .line 315
    invoke-virtual {v2}, Landroid/bluetooth/BluetoothDevice;->getType()I

    move-result v4

    .line 318
    .local v4, "type":I
    const/4 v6, 0x2

    if-eq v4, v6, :cond_1

    const/4 v6, 0x3

    if-ne v4, v6, :cond_0

    .line 319
    :cond_1
    new-instance v3, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-direct {v3, v2}, Lcom/megster/cordova/ble/central/Peripheral;-><init>(Landroid/bluetooth/BluetoothDevice;)V

    .line 320
    .local v3, "p":Lcom/megster/cordova/ble/central/Peripheral;
    invoke-virtual {v3}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject()Lorg/json/JSONObject;

    move-result-object v6

    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 324
    .end local v2    # "device":Landroid/bluetooth/BluetoothDevice;
    .end local v3    # "p":Lcom/megster/cordova/ble/central/Peripheral;
    .end local v4    # "type":I
    :cond_2
    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V

    .line 325
    return-void
.end method

.method private listKnownDevices(Lorg/apache/cordova/CallbackContext;)V
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 624
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 627
    .local v1, "json":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 628
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/megster/cordova/ble/central/Peripheral;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/megster/cordova/ble/central/Peripheral;

    .line 629
    .local v2, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    invoke-virtual {v2}, Lcom/megster/cordova/ble/central/Peripheral;->isUnscanned()Z

    move-result v5

    if-nez v5, :cond_0

    .line 630
    invoke-virtual {v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 634
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/megster/cordova/ble/central/Peripheral;>;"
    .end local v2    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    :cond_1
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v3, v4, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONArray;)V

    .line 635
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 636
    return-void
.end method

.method private locationServicesEnabled()Z
    .locals 4

    .prologue
    .line 613
    const/4 v1, 0x0

    .line 615
    .local v1, "locationMode":I
    :try_start_0
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v2}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "location_mode"

    invoke-static {v2, v3}, Landroid/provider/Settings$Secure;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;)I
    :try_end_0
    .catch Landroid/provider/Settings$SettingNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 619
    :goto_0
    if-lez v1, :cond_0

    const/4 v2, 0x1

    :goto_1
    return v2

    .line 616
    :catch_0
    move-exception v0

    .line 617
    .local v0, "e":Landroid/provider/Settings$SettingNotFoundException;
    const-string v2, "BLEPlugin"

    const-string v3, "Location Mode Setting Not Found"

    invoke-static {v2, v3, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 619
    .end local v0    # "e":Landroid/provider/Settings$SettingNotFoundException;
    :cond_0
    const/4 v2, 0x0

    goto :goto_1
.end method

.method private onBluetoothStateChange(Landroid/content/Intent;)V
    .locals 4
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 339
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 341
    .local v0, "action":Ljava/lang/String;
    const-string v2, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 342
    const-string v2, "android.bluetooth.adapter.extra.STATE"

    const/high16 v3, -0x80000000

    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 343
    .local v1, "state":I
    invoke-direct {p0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->sendBluetoothStateChange(I)V

    .line 345
    .end local v1    # "state":I
    :cond_0
    return-void
.end method

.method private parseServiceUUIDList(Lorg/json/JSONArray;)[Ljava/util/UUID;
    .locals 4
    .param p1, "jsonArray"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 328
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 330
    .local v1, "serviceUUIDs":Ljava/util/List;, "Ljava/util/List<Ljava/util/UUID;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v0, v3, :cond_0

    .line 331
    invoke-virtual {p1, v0}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 332
    .local v2, "uuidString":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 330
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 335
    .end local v2    # "uuidString":Ljava/lang/String;
    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v3

    new-array v3, v3, [Ljava/util/UUID;

    invoke-interface {v1, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/util/UUID;

    return-object v3
.end method

.method private read(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "serviceUUID"    # Ljava/util/UUID;
    .param p4, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 458
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 460
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-nez v0, :cond_0

    .line 461
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 473
    :goto_0
    return-void

    .line 465
    :cond_0
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 466
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not connected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 471
    :cond_1
    invoke-virtual {v0, p1, p3, p4}, Lcom/megster/cordova/ble/central/Peripheral;->queueRead(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto :goto_0
.end method

.method private readRSSI(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;

    .prologue
    .line 477
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 479
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-nez v0, :cond_0

    .line 480
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 489
    :goto_0
    return-void

    .line 484
    :cond_0
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 485
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not connected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 488
    :cond_1
    invoke-virtual {v0, p1}, Lcom/megster/cordova/ble/central/Peripheral;->queueReadRSSI(Lorg/apache/cordova/CallbackContext;)V

    goto :goto_0
.end method

.method private refreshDeviceCache(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;J)V
    .locals 5
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "timeoutMillis"    # J

    .prologue
    .line 445
    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v2, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/megster/cordova/ble/central/Peripheral;

    .line 447
    .local v1, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v1, :cond_0

    .line 448
    invoke-virtual {v1, p1, p3, p4}, Lcom/megster/cordova/ble/central/Peripheral;->refreshDeviceCache(Lorg/apache/cordova/CallbackContext;J)V

    .line 454
    :goto_0
    return-void

    .line 450
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Peripheral "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " not found."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 451
    .local v0, "message":Ljava/lang/String;
    const-string v2, "BLEPlugin"

    invoke-static {v2, v0}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private registerNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "serviceUUID"    # Ljava/util/UUID;
    .param p4, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 513
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 514
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v0, :cond_1

    .line 516
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 517
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not connected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 530
    :goto_0
    return-void

    .line 522
    :cond_0
    invoke-virtual {v0, p1, p3, p4}, Lcom/megster/cordova/ble/central/Peripheral;->queueRegisterNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto :goto_0

    .line 526
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private removeNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "serviceUUID"    # Ljava/util/UUID;
    .param p4, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 534
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 535
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v0, :cond_1

    .line 537
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 538
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not connected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 550
    :goto_0
    return-void

    .line 542
    :cond_0
    invoke-virtual {v0, p1, p3, p4}, Lcom/megster/cordova/ble/central/Peripheral;->queueRemoveNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto :goto_0

    .line 546
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private removeStateListener()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 374
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 376
    :try_start_0
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->webView:Lorg/apache/cordova/CordovaWebView;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaWebView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 381
    :cond_0
    :goto_0
    iput-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    .line 382
    iput-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateReceiver:Landroid/content/BroadcastReceiver;

    .line 383
    return-void

    .line 377
    :catch_0
    move-exception v0

    .line 378
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "BLEPlugin"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error unregistering state receiver: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private requestMtu(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "mtuValue"    # I

    .prologue
    .line 436
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 437
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-eqz v0, :cond_0

    .line 438
    invoke-virtual {v0, p3}, Lcom/megster/cordova/ble/central/Peripheral;->requestMtu(I)V

    .line 440
    :cond_0
    invoke-virtual {p1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 441
    return-void
.end method

.method private resetScanOptions()V
    .locals 1

    .prologue
    .line 716
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->reportDuplicates:Z

    .line 717
    return-void
.end method

.method private sendBluetoothStateChange(I)V
    .locals 4
    .param p1, "state"    # I

    .prologue
    .line 348
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 349
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothStates:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 350
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 351
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 353
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method private uuidFromString(Ljava/lang/String;)Ljava/util/UUID;
    .locals 1
    .param p1, "uuid"    # Ljava/lang/String;

    .prologue
    .line 709
    invoke-static {p1}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method private write(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;[BI)V
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "macAddress"    # Ljava/lang/String;
    .param p3, "serviceUUID"    # Ljava/util/UUID;
    .param p4, "characteristicUUID"    # Ljava/util/UUID;
    .param p5, "data"    # [B
    .param p6, "writeType"    # I

    .prologue
    .line 494
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/Peripheral;

    .line 496
    .local v0, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    if-nez v0, :cond_0

    .line 497
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not found."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 509
    :goto_0
    return-void

    .line 501
    :cond_0
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v1

    if-nez v1, :cond_1

    .line 502
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Peripheral "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not connected."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move v5, p6

    .line 507
    invoke-virtual/range {v0 .. v5}, Lcom/megster/cordova/ble/central/Peripheral;->queueWrite(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    goto :goto_0
.end method


# virtual methods
.method public execute(Ljava/lang/String;Lorg/apache/cordova/CordovaArgs;Lorg/apache/cordova/CallbackContext;)Z
    .locals 24
    .param p1, "action"    # Ljava/lang/String;
    .param p2, "args"    # Lorg/apache/cordova/CordovaArgs;
    .param p3, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 123
    const-string v4, "BLEPlugin"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v23, "action = "

    move-object/from16 v0, v23

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    if-nez v4, :cond_2

    .line 126
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v11

    .line 127
    .local v11, "activity":Landroid/app/Activity;
    invoke-virtual {v11}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    .line 128
    invoke-virtual {v4}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v4

    const-string v5, "android.hardware.bluetooth_le"

    .line 129
    invoke-virtual {v4, v5}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x12

    if-lt v4, v5, :cond_0

    const/4 v13, 0x1

    .line 131
    .local v13, "hardwareSupportsBLE":Z
    :goto_0
    if-nez v13, :cond_1

    .line 132
    const-string v4, "BLEPlugin"

    const-string v5, "This hardware does not support Bluetooth Low Energy."

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    const-string v4, "This hardware does not support Bluetooth Low Energy."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 134
    const/16 v22, 0x0

    .line 306
    .end local v11    # "activity":Landroid/app/Activity;
    .end local v13    # "hardwareSupportsBLE":Z
    :goto_1
    return v22

    .line 129
    .restart local v11    # "activity":Landroid/app/Activity;
    :cond_0
    const/4 v13, 0x0

    goto :goto_0

    .line 136
    .restart local v13    # "hardwareSupportsBLE":Z
    :cond_1
    const-string v4, "bluetooth"

    invoke-virtual {v11, v4}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Landroid/bluetooth/BluetoothManager;

    .line 137
    .local v12, "bluetoothManager":Landroid/bluetooth/BluetoothManager;
    invoke-virtual {v12}, Landroid/bluetooth/BluetoothManager;->getAdapter()Landroid/bluetooth/BluetoothAdapter;

    move-result-object v4

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    .line 140
    .end local v11    # "activity":Landroid/app/Activity;
    .end local v12    # "bluetoothManager":Landroid/bluetooth/BluetoothManager;
    .end local v13    # "hardwareSupportsBLE":Z
    :cond_2
    const/16 v22, 0x1

    .line 142
    .local v22, "validAction":Z
    const-string v4, "scan"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 144
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->parseServiceUUIDList(Lorg/json/JSONArray;)[Ljava/util/UUID;

    move-result-object v19

    .line 145
    .local v19, "serviceUUIDs":[Ljava/util/UUID;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getInt(I)I

    move-result v18

    .line 146
    .local v18, "scanSeconds":I
    invoke-direct/range {p0 .. p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->resetScanOptions()V

    .line 147
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    move/from16 v3, v18

    invoke-direct {v0, v1, v2, v3}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V

    goto :goto_1

    .line 149
    .end local v18    # "scanSeconds":I
    .end local v19    # "serviceUUIDs":[Ljava/util/UUID;
    :cond_3
    const-string v4, "startScan"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 151
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->parseServiceUUIDList(Lorg/json/JSONArray;)[Ljava/util/UUID;

    move-result-object v19

    .line 152
    .restart local v19    # "serviceUUIDs":[Ljava/util/UUID;
    invoke-direct/range {p0 .. p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->resetScanOptions()V

    .line 153
    const/4 v4, -0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V

    goto :goto_1

    .line 155
    .end local v19    # "serviceUUIDs":[Ljava/util/UUID;
    :cond_4
    const-string v4, "stopScan"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 157
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Landroid/bluetooth/BluetoothAdapter;->stopLeScan(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)V

    .line 158
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto :goto_1

    .line 160
    :cond_5
    const-string v4, "list"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 162
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->listKnownDevices(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 164
    :cond_6
    const-string v4, "connect"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 166
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 167
    .local v6, "macAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->connect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 169
    .end local v6    # "macAddress":Ljava/lang/String;
    :cond_7
    const-string v4, "autoConnect"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 171
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 172
    .restart local v6    # "macAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->autoConnect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 174
    .end local v6    # "macAddress":Ljava/lang/String;
    :cond_8
    const-string v4, "disconnect"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 176
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 177
    .restart local v6    # "macAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->disconnect(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 179
    .end local v6    # "macAddress":Ljava/lang/String;
    :cond_9
    const-string v4, "requestMtu"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 181
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 182
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getInt(I)I

    move-result v15

    .line 183
    .local v15, "mtuValue":I
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6, v15}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->requestMtu(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;I)V

    goto/16 :goto_1

    .line 185
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v15    # "mtuValue":I
    :cond_a
    const-string v4, "refreshDeviceCache"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 187
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 188
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getLong(I)J

    move-result-wide v20

    .line 190
    .local v20, "timeoutMillis":J
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-wide/from16 v2, v20

    invoke-direct {v0, v1, v6, v2, v3}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->refreshDeviceCache(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;J)V

    goto/16 :goto_1

    .line 192
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v20    # "timeoutMillis":J
    :cond_b
    const-string v4, "read"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c

    .line 194
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 195
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    .line 196
    .local v7, "serviceUUID":Ljava/util/UUID;
    const/4 v4, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    .line 197
    .local v8, "characteristicUUID":Ljava/util/UUID;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6, v7, v8}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->read(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V

    goto/16 :goto_1

    .line 199
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v7    # "serviceUUID":Ljava/util/UUID;
    .end local v8    # "characteristicUUID":Ljava/util/UUID;
    :cond_c
    const-string v4, "readRSSI"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 201
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 202
    .restart local v6    # "macAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->readRSSI(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 204
    .end local v6    # "macAddress":Ljava/lang/String;
    :cond_d
    const-string v4, "write"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 206
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 207
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    .line 208
    .restart local v7    # "serviceUUID":Ljava/util/UUID;
    const/4 v4, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    .line 209
    .restart local v8    # "characteristicUUID":Ljava/util/UUID;
    const/4 v4, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getArrayBuffer(I)[B

    move-result-object v9

    .line 210
    .local v9, "data":[B
    const/4 v10, 0x2

    .local v10, "type":I
    move-object/from16 v4, p0

    move-object/from16 v5, p3

    .line 211
    invoke-direct/range {v4 .. v10}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->write(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    goto/16 :goto_1

    .line 213
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v7    # "serviceUUID":Ljava/util/UUID;
    .end local v8    # "characteristicUUID":Ljava/util/UUID;
    .end local v9    # "data":[B
    .end local v10    # "type":I
    :cond_e
    const-string v4, "writeWithoutResponse"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 215
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 216
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    .line 217
    .restart local v7    # "serviceUUID":Ljava/util/UUID;
    const/4 v4, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    .line 218
    .restart local v8    # "characteristicUUID":Ljava/util/UUID;
    const/4 v4, 0x3

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getArrayBuffer(I)[B

    move-result-object v9

    .line 219
    .restart local v9    # "data":[B
    const/4 v10, 0x1

    .restart local v10    # "type":I
    move-object/from16 v4, p0

    move-object/from16 v5, p3

    .line 220
    invoke-direct/range {v4 .. v10}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->write(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    goto/16 :goto_1

    .line 222
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v7    # "serviceUUID":Ljava/util/UUID;
    .end local v8    # "characteristicUUID":Ljava/util/UUID;
    .end local v9    # "data":[B
    .end local v10    # "type":I
    :cond_f
    const-string v4, "startNotification"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 224
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 225
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    .line 226
    .restart local v7    # "serviceUUID":Ljava/util/UUID;
    const/4 v4, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    .line 227
    .restart local v8    # "characteristicUUID":Ljava/util/UUID;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6, v7, v8}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->registerNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V

    goto/16 :goto_1

    .line 229
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v7    # "serviceUUID":Ljava/util/UUID;
    .end local v8    # "characteristicUUID":Ljava/util/UUID;
    :cond_10
    const-string v4, "stopNotification"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_11

    .line 231
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 232
    .restart local v6    # "macAddress":Ljava/lang/String;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    .line 233
    .restart local v7    # "serviceUUID":Ljava/util/UUID;
    const/4 v4, 0x2

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v8

    .line 234
    .restart local v8    # "characteristicUUID":Ljava/util/UUID;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1, v6, v7, v8}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->removeNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/lang/String;Ljava/util/UUID;Ljava/util/UUID;)V

    goto/16 :goto_1

    .line 236
    .end local v6    # "macAddress":Ljava/lang/String;
    .end local v7    # "serviceUUID":Ljava/util/UUID;
    .end local v8    # "characteristicUUID":Ljava/util/UUID;
    :cond_11
    const-string v4, "isEnabled"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 238
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->isEnabled()Z

    move-result v4

    if-eqz v4, :cond_12

    .line 239
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_1

    .line 241
    :cond_12
    const-string v4, "Bluetooth is disabled."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 244
    :cond_13
    const-string v4, "isConnected"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_15

    .line 246
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 248
    .restart local v6    # "macAddress":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_14

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-virtual {v4}, Lcom/megster/cordova/ble/central/Peripheral;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_14

    .line 249
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_1

    .line 251
    :cond_14
    const-string v4, "Not connected."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 254
    .end local v6    # "macAddress":Ljava/lang/String;
    :cond_15
    const-string v4, "showBluetoothSettings"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_16

    .line 256
    new-instance v14, Landroid/content/Intent;

    const-string v4, "android.settings.BLUETOOTH_SETTINGS"

    invoke-direct {v14, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 257
    .local v14, "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v4}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v4, v14}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 258
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_1

    .line 260
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_16
    const-string v4, "enable"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_17

    .line 262
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    .line 263
    new-instance v14, Landroid/content/Intent;

    const-string v4, "android.bluetooth.adapter.action.REQUEST_ENABLE"

    invoke-direct {v14, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 264
    .restart local v14    # "intent":Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    const/4 v5, 0x1

    move-object/from16 v0, p0

    invoke-interface {v4, v0, v14, v5}, Lorg/apache/cordova/CordovaInterface;->startActivityForResult(Lorg/apache/cordova/CordovaPlugin;Landroid/content/Intent;I)V

    goto/16 :goto_1

    .line 266
    .end local v14    # "intent":Landroid/content/Intent;
    :cond_17
    const-string v4, "startStateNotifications"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_19

    .line 268
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_18

    .line 269
    const-string v4, "State callback already registered."

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 271
    :cond_18
    move-object/from16 v0, p3

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    .line 272
    invoke-direct/range {p0 .. p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->addStateListener()V

    .line 273
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    invoke-virtual {v4}, Landroid/bluetooth/BluetoothAdapter;->getState()I

    move-result v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->sendBluetoothStateChange(I)V

    goto/16 :goto_1

    .line 276
    :cond_19
    const-string v4, "stopStateNotifications"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    .line 278
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_1a

    .line 280
    new-instance v17, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    move-object/from16 v0, v17

    invoke-direct {v0, v4}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 281
    .local v17, "result":Lorg/apache/cordova/PluginResult;
    const/4 v4, 0x0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 282
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    move-object/from16 v0, v17

    invoke-virtual {v4, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 283
    const/4 v4, 0x0

    move-object/from16 v0, p0

    iput-object v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->stateCallback:Lorg/apache/cordova/CallbackContext;

    .line 285
    .end local v17    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1a
    invoke-direct/range {p0 .. p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->removeStateListener()V

    .line 286
    invoke-virtual/range {p3 .. p3}, Lorg/apache/cordova/CallbackContext;->success()V

    goto/16 :goto_1

    .line 288
    :cond_1b
    const-string v4, "startScanWithOptions"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 289
    const/4 v4, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getJSONArray(I)Lorg/json/JSONArray;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-direct {v0, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->parseServiceUUIDList(Lorg/json/JSONArray;)[Ljava/util/UUID;

    move-result-object v19

    .line 290
    .restart local v19    # "serviceUUIDs":[Ljava/util/UUID;
    const/4 v4, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/apache/cordova/CordovaArgs;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v16

    .line 292
    .local v16, "options":Lorg/json/JSONObject;
    invoke-direct/range {p0 .. p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->resetScanOptions()V

    .line 293
    const-string v4, "reportDuplicates"

    const/4 v5, 0x0

    move-object/from16 v0, v16

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    move-result v4

    move-object/from16 v0, p0

    iput-boolean v4, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->reportDuplicates:Z

    .line 294
    const/4 v4, -0x1

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, v19

    invoke-direct {v0, v1, v2, v4}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V

    goto/16 :goto_1

    .line 296
    .end local v16    # "options":Lorg/json/JSONObject;
    .end local v19    # "serviceUUIDs":[Ljava/util/UUID;
    :cond_1c
    const-string v4, "bondedDevices"

    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 298
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->getBondedDevices(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_1

    .line 302
    :cond_1d
    const/16 v22, 0x0

    goto/16 :goto_1
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 669
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 671
    const/4 v0, -0x1

    if-ne p2, v0, :cond_2

    .line 672
    const-string v0, "BLEPlugin"

    const-string v1, "User enabled Bluetooth"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 674
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 683
    :cond_0
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    .line 685
    :cond_1
    return-void

    .line 677
    :cond_2
    const-string v0, "BLEPlugin"

    const-string v1, "User did *NOT* enable Bluetooth"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 678
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 679
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->enableBluetoothCallback:Lorg/apache/cordova/CallbackContext;

    const-string v1, "User did not enable Bluetooth"

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->removeStateListener()V

    .line 115
    return-void
.end method

.method public onLeScan(Landroid/bluetooth/BluetoothDevice;I[B)V
    .locals 7
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "rssi"    # I
    .param p3, "scanRecord"    # [B

    .prologue
    const/4 v5, 0x1

    .line 641
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v0

    .line 642
    .local v0, "address":Ljava/lang/String;
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-virtual {v4}, Lcom/megster/cordova/ble/central/Peripheral;->isUnscanned()Z

    move-result v4

    if-nez v4, :cond_1

    move v1, v5

    .line 644
    .local v1, "alreadyReported":Z
    :goto_0
    if-nez v1, :cond_2

    .line 646
    new-instance v2, Lcom/megster/cordova/ble/central/Peripheral;

    invoke-direct {v2, p1, p2, p3}, Lcom/megster/cordova/ble/central/Peripheral;-><init>(Landroid/bluetooth/BluetoothDevice;I[B)V

    .line 647
    .local v2, "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 649
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->discoverCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_0

    .line 650
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject()Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v3, v4, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 651
    .local v3, "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v3, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 652
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->discoverCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 664
    .end local v3    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_1
    return-void

    .line 642
    .end local v1    # "alreadyReported":Z
    .end local v2    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 656
    .restart local v1    # "alreadyReported":Z
    :cond_2
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->peripherals:Ljava/util/Map;

    invoke-interface {v4, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/megster/cordova/ble/central/Peripheral;

    .line 657
    .restart local v2    # "peripheral":Lcom/megster/cordova/ble/central/Peripheral;
    invoke-virtual {v2, p2, p3}, Lcom/megster/cordova/ble/central/Peripheral;->update(I[B)V

    .line 658
    iget-boolean v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->reportDuplicates:Z

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->discoverCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v4, :cond_0

    .line 659
    new-instance v3, Lorg/apache/cordova/PluginResult;

    sget-object v4, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject()Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v3, v4, v6}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 660
    .restart local v3    # "result":Lorg/apache/cordova/PluginResult;
    invoke-virtual {v3, v5}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 661
    iget-object v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->discoverCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v4, v3}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_1
.end method

.method public onRequestPermissionResult(I[Ljava/lang/String;[I)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 689
    array-length v2, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v2, :cond_1

    aget v0, p3, v1

    .line 690
    .local v0, "result":I
    if-ne v0, v4, :cond_0

    .line 691
    const-string v1, "BLEPlugin"

    const-string v2, "User *rejected* Coarse Location Access"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 692
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->permissionCallback:Lorg/apache/cordova/CallbackContext;

    const-string v2, "Location permission not granted."

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 706
    .end local v0    # "result":I
    :goto_1
    return-void

    .line 689
    .restart local v0    # "result":I
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 697
    .end local v0    # "result":I
    :cond_1
    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 699
    :pswitch_0
    const-string v1, "BLEPlugin"

    const-string v2, "User granted Coarse Location Access"

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 700
    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->permissionCallback:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->serviceUUIDs:[Ljava/util/UUID;

    iget v3, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->scanSeconds:I

    invoke-direct {p0, v1, v2, v3}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V

    .line 701
    iput-object v5, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->permissionCallback:Lorg/apache/cordova/CallbackContext;

    .line 702
    iput-object v5, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->serviceUUIDs:[Ljava/util/UUID;

    .line 703
    iput v4, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->scanSeconds:I

    goto :goto_1

    .line 697
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
    .end packed-switch
.end method

.method public onReset()V
    .locals 0

    .prologue
    .line 118
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->removeStateListener()V

    .line 119
    return-void
.end method
