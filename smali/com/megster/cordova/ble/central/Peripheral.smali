.class public Lcom/megster/cordova/ble/central/Peripheral;
.super Landroid/bluetooth/BluetoothGattCallback;
.source "Peripheral.java"


# static fields
.field public static final CLIENT_CHARACTERISTIC_CONFIGURATION_UUID:Ljava/util/UUID;

.field private static final FAKE_PERIPHERAL_RSSI:I = 0x7fffffff

.field private static final TAG:Ljava/lang/String; = "Peripheral"


# instance fields
.field private advertisingData:[B

.field private advertisingRSSI:I

.field private autoconnect:Z

.field private bleProcessing:Z

.field private commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/megster/cordova/ble/central/BLECommand;",
            ">;"
        }
    .end annotation
.end field

.field private connectCallback:Lorg/apache/cordova/CallbackContext;

.field private connected:Z

.field private connecting:Z

.field private currentActivity:Landroid/app/Activity;

.field private device:Landroid/bluetooth/BluetoothDevice;

.field gatt:Landroid/bluetooth/BluetoothGatt;

.field private notificationCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CallbackContext;",
            ">;"
        }
    .end annotation
.end field

.field private readCallback:Lorg/apache/cordova/CallbackContext;

.field private refreshCallback:Lorg/apache/cordova/CallbackContext;

.field private writeCallback:Lorg/apache/cordova/CallbackContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-string v0, "2902"

    invoke-static {v0}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidFromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    sput-object v0, Lcom/megster/cordova/ble/central/Peripheral;->CLIENT_CHARACTERISTIC_CONFIGURATION_UUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Landroid/bluetooth/BluetoothDevice;)V
    .locals 3
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;

    .prologue
    const/4 v0, 0x0

    .line 66
    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    .line 50
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    .line 51
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 52
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->notificationCallbacks:Ljava/util/Map;

    .line 68
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Creating un-scanned peripheral entry for address: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    .line 71
    const v0, 0x7fffffff

    iput v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    .line 72
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/bluetooth/BluetoothDevice;I[B)V
    .locals 1
    .param p1, "device"    # Landroid/bluetooth/BluetoothDevice;
    .param p2, "advertisingRSSI"    # I
    .param p3, "scanRecord"    # [B

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0}, Landroid/bluetooth/BluetoothGattCallback;-><init>()V

    .line 50
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    .line 51
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 52
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 53
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 64
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->notificationCallbacks:Ljava/util/Map;

    .line 78
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    .line 79
    iput p2, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    .line 80
    iput-object p3, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    .line 82
    return-void
.end method

.method static byteArrayToJSON([B)Lorg/json/JSONObject;
    .locals 3
    .param p0, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 319
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 320
    .local v0, "object":Lorg/json/JSONObject;
    const-string v1, "CDVType"

    const-string v2, "ArrayBuffer"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 321
    const-string v1, "data"

    const/4 v2, 0x2

    invoke-static {p0, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 322
    return-object v0
.end method

.method private callbackCleanup()V
    .locals 2

    .prologue
    .line 795
    monitor-enter p0

    .line 796
    :try_start_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 797
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    const-string v1, "Peripheral Disconnected"

    invoke-virtual {p0, v1}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 798
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 799
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 801
    :cond_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_1

    .line 802
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    const-string v1, "Peripheral Disconnected"

    invoke-virtual {p0, v1}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 803
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    .line 804
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 806
    :cond_1
    monitor-exit p0

    .line 807
    return-void

    .line 806
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private commandCompleted()V
    .locals 2

    .prologue
    .line 825
    const-string v0, "Peripheral"

    const-string v1, "Processing Complete"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 826
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 827
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->processCommands()V

    .line 828
    return-void
.end method

.method private findNotifyCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;
    .locals 6
    .param p1, "service"    # Landroid/bluetooth/BluetoothGattService;
    .param p2, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 570
    const/4 v1, 0x0

    .line 573
    .local v1, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v3

    .line 574
    .local v3, "characteristics":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattCharacteristic;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 575
    .local v0, "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/lit8 v5, v5, 0x10

    if-eqz v5, :cond_0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 576
    move-object v1, v0

    .line 581
    .end local v0    # "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_1
    if-eqz v1, :cond_2

    move-object v2, v1

    .line 596
    .end local v1    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .local v2, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    :goto_0
    return-object v2

    .line 584
    .end local v2    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .restart local v1    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_2
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 585
    .restart local v0    # "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/lit8 v5, v5, 0x20

    if-eqz v5, :cond_3

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 586
    move-object v1, v0

    .line 592
    .end local v0    # "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_4
    if-nez v1, :cond_5

    .line 593
    invoke-virtual {p1, p2}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v1

    :cond_5
    move-object v2, v1

    .line 596
    .end local v1    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .restart local v2    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    goto :goto_0
.end method

.method private findReadableCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;
    .locals 6
    .param p1, "service"    # Landroid/bluetooth/BluetoothGattService;
    .param p2, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 666
    const/4 v1, 0x0

    .line 668
    .local v1, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    const/4 v3, 0x2

    .line 670
    .local v3, "read":I
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v2

    .line 671
    .local v2, "characteristics":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattCharacteristic;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 672
    .local v0, "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/2addr v5, v3

    if-eqz v5, :cond_0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 673
    move-object v1, v0

    .line 679
    .end local v0    # "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_1
    if-nez v1, :cond_2

    .line 680
    invoke-virtual {p1, p2}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v1

    .line 683
    :cond_2
    return-object v1
.end method

.method private findWritableCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;I)Landroid/bluetooth/BluetoothGattCharacteristic;
    .locals 6
    .param p1, "service"    # Landroid/bluetooth/BluetoothGattService;
    .param p2, "characteristicUUID"    # Ljava/util/UUID;
    .param p3, "writeType"    # I

    .prologue
    .line 730
    const/4 v1, 0x0

    .line 733
    .local v1, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    const/16 v3, 0x8

    .line 734
    .local v3, "writeProperty":I
    const/4 v4, 0x1

    if-ne p3, v4, :cond_0

    .line 735
    const/4 v3, 0x4

    .line 738
    :cond_0
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v2

    .line 739
    .local v2, "characteristics":Ljava/util/List;, "Ljava/util/List<Landroid/bluetooth/BluetoothGattCharacteristic;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 740
    .local v0, "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/2addr v5, v3

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 741
    move-object v1, v0

    .line 747
    .end local v0    # "c":Landroid/bluetooth/BluetoothGattCharacteristic;
    :cond_2
    if-nez v1, :cond_3

    .line 748
    invoke-virtual {p1, p2}, Landroid/bluetooth/BluetoothGattService;->getCharacteristic(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v1

    .line 751
    :cond_3
    return-object v1
.end method

.method private gattConnect()V
    .locals 4

    .prologue
    .line 86
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v1, :cond_0

    .line 87
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 88
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->close()V

    .line 89
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    .line 91
    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 92
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 93
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCleanup()V

    .line 94
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->callbackCleanup()V

    .line 96
    invoke-virtual {p0}, Lcom/megster/cordova/ble/central/Peripheral;->getDevice()Landroid/bluetooth/BluetoothDevice;

    move-result-object v0

    .line 97
    .local v0, "device":Landroid/bluetooth/BluetoothDevice;
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_1

    .line 98
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->currentActivity:Landroid/app/Activity;

    iget-boolean v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    invoke-virtual {v0, v1, v2, p0}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    .line 103
    :goto_0
    return-void

    .line 100
    :cond_1
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->currentActivity:Landroid/app/Activity;

    iget-boolean v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    const/4 v3, 0x2

    invoke-virtual {v0, v1, v2, p0, v3}, Landroid/bluetooth/BluetoothDevice;->connectGatt(Landroid/content/Context;ZLandroid/bluetooth/BluetoothGattCallback;I)Landroid/bluetooth/BluetoothGatt;

    move-result-object v1

    iput-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    goto :goto_0
.end method

.method private generateHashKey(Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;
    .locals 1
    .param p1, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 873
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGattCharacteristic;->getService()Landroid/bluetooth/BluetoothGattService;

    move-result-object v0

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/megster/cordova/ble/central/Peripheral;->generateHashKey(Ljava/util/UUID;Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private generateHashKey(Ljava/util/UUID;Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;
    .locals 2
    .param p1, "serviceUUID"    # Ljava/util/UUID;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 877
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getInstanceId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private peripheralDisconnected()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 135
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 136
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 139
    iget-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 141
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->close()V

    .line 142
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    .line 145
    :cond_0
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->sendDisconnectMessage()V

    .line 147
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCleanup()V

    .line 148
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->callbackCleanup()V

    .line 149
    return-void
.end method

.method private processCommands()V
    .locals 7

    .prologue
    const/4 v3, 0x1

    .line 832
    const-string v0, "Peripheral"

    const-string v1, "Processing Commands"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 834
    iget-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    if-eqz v0, :cond_0

    .line 870
    :goto_0
    return-void

    .line 836
    :cond_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/megster/cordova/ble/central/BLECommand;

    .line 837
    .local v6, "command":Lcom/megster/cordova/ble/central/BLECommand;
    if-eqz v6, :cond_7

    .line 838
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->READ:I

    if-ne v0, v1, :cond_1

    .line 839
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Read "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 840
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 841
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getServiceUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/megster/cordova/ble/central/Peripheral;->readCharacteristic(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto :goto_0

    .line 842
    :cond_1
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 843
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Write "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 844
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 845
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getServiceUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getData()[B

    move-result-object v4

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/megster/cordova/ble/central/Peripheral;->writeCharacteristic(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    goto :goto_0

    .line 846
    :cond_2
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    if-ne v0, v3, :cond_3

    .line 847
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Write No Response "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 848
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 849
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getServiceUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getData()[B

    move-result-object v4

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v5

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/megster/cordova/ble/central/Peripheral;->writeCharacteristic(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    goto/16 :goto_0

    .line 850
    :cond_3
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->REGISTER_NOTIFY:I

    if-ne v0, v1, :cond_4

    .line 851
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Register Notify "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 852
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 853
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getServiceUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/megster/cordova/ble/central/Peripheral;->registerNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto/16 :goto_0

    .line 854
    :cond_4
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->REMOVE_NOTIFY:I

    if-ne v0, v1, :cond_5

    .line 855
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remove Notify "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 856
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 857
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getServiceUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCharacteristicUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/megster/cordova/ble/central/Peripheral;->removeNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V

    goto/16 :goto_0

    .line 858
    :cond_5
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v0

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->READ_RSSI:I

    if-ne v0, v1, :cond_6

    .line 859
    const-string v0, "Peripheral"

    const-string v1, "Read RSSI"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 860
    iput-boolean v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 861
    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->readRSSI(Lorg/apache/cordova/CallbackContext;)V

    goto/16 :goto_0

    .line 864
    :cond_6
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected BLE Command type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v6}, Lcom/megster/cordova/ble/central/BLECommand;->getType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 867
    :cond_7
    const-string v0, "Peripheral"

    const-string v1, "Command Queue is empty."

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private queueCleanup()V
    .locals 3

    .prologue
    .line 781
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    .line 784
    :goto_0
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/megster/cordova/ble/central/BLECommand;

    .line 785
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    if-eqz v0, :cond_0

    .line 786
    invoke-virtual {v0}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    const-string v2, "Peripheral Disconnected"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 792
    :cond_0
    return-void
.end method

.method private queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V
    .locals 4
    .param p1, "command"    # Lcom/megster/cordova/ble/central/BLECommand;

    .prologue
    .line 811
    const-string v1, "Peripheral"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Queuing Command "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->commandQueue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 814
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 815
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 816
    invoke-virtual {p1}, Lcom/megster/cordova/ble/central/BLECommand;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 818
    iget-boolean v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->bleProcessing:Z

    if-nez v1, :cond_0

    .line 819
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->processCommands()V

    .line 821
    :cond_0
    return-void
.end method

.method private readCharacteristic(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 5
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 601
    const/4 v2, 0x0

    .line 603
    .local v2, "success":Z
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v3, :cond_1

    .line 604
    const-string v3, "BluetoothGatt is null"

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 635
    :cond_0
    :goto_0
    return-void

    .line 608
    :cond_1
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3, p2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v1

    .line 610
    .local v1, "service":Landroid/bluetooth/BluetoothGattService;
    if-nez v1, :cond_2

    .line 611
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 615
    :cond_2
    invoke-direct {p0, v1, p3}, Lcom/megster/cordova/ble/central/Peripheral;->findReadableCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v0

    .line 617
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    if-nez v0, :cond_3

    .line 618
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Characteristic "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 631
    :goto_1
    if-nez v2, :cond_0

    .line 632
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    goto :goto_0

    .line 620
    :cond_3
    monitor-enter p0

    .line 621
    :try_start_0
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 622
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothGatt;->readCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 623
    const/4 v2, 0x1

    .line 628
    :goto_2
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 625
    :cond_4
    const/4 v3, 0x0

    :try_start_1
    iput-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 626
    const-string v3, "Read failed"

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method

.method private readRSSI(Lorg/apache/cordova/CallbackContext;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 639
    const/4 v0, 0x0

    .line 641
    .local v0, "success":Z
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v1, :cond_1

    .line 642
    const-string v1, "BluetoothGatt is null"

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 661
    :cond_0
    :goto_0
    return-void

    .line 646
    :cond_1
    monitor-enter p0

    .line 647
    :try_start_0
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 649
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v1}, Landroid/bluetooth/BluetoothGatt;->readRemoteRssi()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 650
    const/4 v0, 0x1

    .line 655
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 657
    if-nez v0, :cond_0

    .line 658
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    goto :goto_0

    .line 652
    :cond_2
    const/4 v1, 0x0

    :try_start_1
    iput-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 653
    const-string v1, "Read RSSI failed"

    invoke-virtual {p1, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 655
    :catchall_0
    move-exception v1

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private registerNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 8
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 478
    const/4 v4, 0x0

    .line 480
    .local v4, "success":Z
    iget-object v5, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v5, :cond_1

    .line 481
    const-string v5, "BluetoothGatt is null"

    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 529
    :cond_0
    :goto_0
    return-void

    .line 485
    :cond_1
    iget-object v5, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v5, p2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v3

    .line 486
    .local v3, "service":Landroid/bluetooth/BluetoothGattService;
    invoke-direct {p0, v3, p3}, Lcom/megster/cordova/ble/central/Peripheral;->findNotifyCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v0

    .line 487
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-direct {p0, p2, v0}, Lcom/megster/cordova/ble/central/Peripheral;->generateHashKey(Ljava/util/UUID;Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;

    move-result-object v2

    .line 489
    .local v2, "key":Ljava/lang/String;
    if-eqz v0, :cond_7

    .line 491
    iget-object v5, p0, Lcom/megster/cordova/ble/central/Peripheral;->notificationCallbacks:Ljava/util/Map;

    invoke-interface {v5, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 493
    iget-object v5, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    const/4 v6, 0x1

    invoke-virtual {v5, v0, v6}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 496
    sget-object v5, Lcom/megster/cordova/ble/central/Peripheral;->CLIENT_CHARACTERISTIC_CONFIGURATION_UUID:Ljava/util/UUID;

    invoke-virtual {v0, v5}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object v1

    .line 497
    .local v1, "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    if-eqz v1, :cond_5

    .line 500
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/lit8 v5, v5, 0x10

    if-eqz v5, :cond_2

    .line 501
    sget-object v5, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_NOTIFICATION_VALUE:[B

    invoke-virtual {v1, v5}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    .line 508
    :goto_1
    iget-object v5, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v5, v1}, Landroid/bluetooth/BluetoothGatt;->writeDescriptor(Landroid/bluetooth/BluetoothGattDescriptor;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 509
    const/4 v4, 0x1

    .line 526
    .end local v1    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    :goto_2
    if-nez v4, :cond_0

    .line 527
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    goto :goto_0

    .line 502
    .restart local v1    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    :cond_2
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v5

    and-int/lit8 v5, v5, 0x20

    if-eqz v5, :cond_3

    .line 503
    sget-object v5, Landroid/bluetooth/BluetoothGattDescriptor;->ENABLE_INDICATION_VALUE:[B

    invoke-virtual {v1, v5}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    goto :goto_1

    .line 505
    :cond_3
    const-string v5, "Peripheral"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Characteristic "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " does not have NOTIFY or INDICATE property set"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 511
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to set client characteristic notification for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 515
    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Set notification failed for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 519
    .end local v1    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    :cond_6
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Failed to register notification for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_2

    .line 523
    :cond_7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Characteristic "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " not found"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method private removeNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 533
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v4, :cond_0

    .line 534
    const-string v4, "BluetoothGatt is null"

    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 564
    :goto_0
    return-void

    .line 538
    :cond_0
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v4, p2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v3

    .line 539
    .local v3, "service":Landroid/bluetooth/BluetoothGattService;
    invoke-direct {p0, v3, p3}, Lcom/megster/cordova/ble/central/Peripheral;->findNotifyCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v0

    .line 540
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    invoke-direct {p0, p2, v0}, Lcom/megster/cordova/ble/central/Peripheral;->generateHashKey(Ljava/util/UUID;Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;

    move-result-object v2

    .line 542
    .local v2, "key":Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 544
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->notificationCallbacks:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v5}, Landroid/bluetooth/BluetoothGatt;->setCharacteristicNotification(Landroid/bluetooth/BluetoothGattCharacteristic;Z)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 547
    sget-object v4, Lcom/megster/cordova/ble/central/Peripheral;->CLIENT_CHARACTERISTIC_CONFIGURATION_UUID:Ljava/util/UUID;

    invoke-virtual {v0, v4}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptor(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattDescriptor;

    move-result-object v1

    .line 548
    .local v1, "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    if-eqz v1, :cond_1

    .line 549
    sget-object v4, Landroid/bluetooth/BluetoothGattDescriptor;->DISABLE_NOTIFICATION_VALUE:[B

    invoke-virtual {v1, v4}, Landroid/bluetooth/BluetoothGattDescriptor;->setValue([B)Z

    .line 550
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v4, v1}, Landroid/bluetooth/BluetoothGatt;->writeDescriptor(Landroid/bluetooth/BluetoothGattDescriptor;)Z

    .line 552
    :cond_1
    invoke-virtual {p1}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 562
    .end local v1    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    :goto_1
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    goto :goto_0

    .line 555
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Failed to stop notification for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1

    .line 559
    :cond_3
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Characteristic "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " not found"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private sendDisconnectMessage()V
    .locals 3

    .prologue
    .line 153
    iget-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v2, :cond_0

    .line 154
    const-string v2, "Peripheral Disconnected"

    invoke-virtual {p0, v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 155
    .local v0, "message":Lorg/json/JSONObject;
    iget-boolean v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    if-eqz v2, :cond_1

    .line 156
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 157
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 158
    iget-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 164
    .end local v0    # "message":Lorg/json/JSONObject;
    .end local v1    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    :goto_0
    return-void

    .line 160
    .restart local v0    # "message":Lorg/json/JSONObject;
    :cond_1
    iget-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v0}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 161
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    goto :goto_0
.end method

.method private writeCharacteristic(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V
    .locals 5
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;
    .param p4, "data"    # [B
    .param p5, "writeType"    # I

    .prologue
    .line 688
    const/4 v2, 0x0

    .line 690
    .local v2, "success":Z
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-nez v3, :cond_1

    .line 691
    const-string v3, "BluetoothGatt is null"

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 725
    :cond_0
    :goto_0
    return-void

    .line 695
    :cond_1
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3, p2}, Landroid/bluetooth/BluetoothGatt;->getService(Ljava/util/UUID;)Landroid/bluetooth/BluetoothGattService;

    move-result-object v1

    .line 697
    .local v1, "service":Landroid/bluetooth/BluetoothGattService;
    if-nez v1, :cond_2

    .line 698
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Service "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 702
    :cond_2
    invoke-direct {p0, v1, p3, p5}, Lcom/megster/cordova/ble/central/Peripheral;->findWritableCharacteristic(Landroid/bluetooth/BluetoothGattService;Ljava/util/UUID;I)Landroid/bluetooth/BluetoothGattCharacteristic;

    move-result-object v0

    .line 704
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    if-nez v0, :cond_3

    .line 705
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Characteristic "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " not found."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 721
    :goto_1
    if-nez v2, :cond_0

    .line 722
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    goto :goto_0

    .line 707
    :cond_3
    invoke-virtual {v0, p4}, Landroid/bluetooth/BluetoothGattCharacteristic;->setValue([B)Z

    .line 708
    invoke-virtual {v0, p5}, Landroid/bluetooth/BluetoothGattCharacteristic;->setWriteType(I)V

    .line 709
    monitor-enter p0

    .line 710
    :try_start_0
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    .line 712
    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v3, v0}, Landroid/bluetooth/BluetoothGatt;->writeCharacteristic(Landroid/bluetooth/BluetoothGattCharacteristic;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 713
    const/4 v2, 0x1

    .line 718
    :goto_2
    monitor-exit p0

    goto :goto_1

    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v3

    .line 715
    :cond_4
    const/4 v3, 0x0

    :try_start_1
    iput-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    .line 716
    const-string v3, "Write failed"

    invoke-virtual {p1, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method


# virtual methods
.method public asJSONObject()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 228
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 231
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "name"

    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    const-string v2, "id"

    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 233
    iget-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    if-eqz v2, :cond_0

    .line 234
    const-string v2, "advertising"

    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    invoke-static {v3}, Lcom/megster/cordova/ble/central/Peripheral;->byteArrayToJSON([B)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 237
    :cond_0
    iget v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    const v3, 0x7fffffff

    if-eq v2, v3, :cond_1

    .line 238
    const-string v2, "rssi"

    iget v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 244
    :cond_1
    :goto_0
    return-object v1

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public asJSONObject(Landroid/bluetooth/BluetoothGatt;)Lorg/json/JSONObject;
    .locals 15
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;

    .prologue
    .line 264
    invoke-virtual {p0}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject()Lorg/json/JSONObject;

    move-result-object v7

    .line 267
    .local v7, "json":Lorg/json/JSONObject;
    :try_start_0
    new-instance v9, Lorg/json/JSONArray;

    invoke-direct {v9}, Lorg/json/JSONArray;-><init>()V

    .line 268
    .local v9, "servicesArray":Lorg/json/JSONArray;
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 269
    .local v1, "characteristicsArray":Lorg/json/JSONArray;
    const-string v10, "services"

    invoke-virtual {v7, v10, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 270
    const-string v10, "characteristics"

    invoke-virtual {v7, v10, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 272
    iget-boolean v10, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    if-eqz v10, :cond_4

    if-eqz p1, :cond_4

    .line 273
    invoke-virtual/range {p1 .. p1}, Landroid/bluetooth/BluetoothGatt;->getServices()Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_4

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/bluetooth/BluetoothGattService;

    .line 274
    .local v8, "service":Landroid/bluetooth/BluetoothGattService;
    invoke-virtual {v8}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v11

    invoke-static {v11}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidToString(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 276
    invoke-virtual {v8}, Landroid/bluetooth/BluetoothGattService;->getCharacteristics()Ljava/util/List;

    move-result-object v11

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :cond_1
    :goto_0
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_0

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/bluetooth/BluetoothGattCharacteristic;

    .line 277
    .local v0, "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 278
    .local v2, "characteristicsJSON":Lorg/json/JSONObject;
    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 280
    const-string v12, "service"

    invoke-virtual {v8}, Landroid/bluetooth/BluetoothGattService;->getUuid()Ljava/util/UUID;

    move-result-object v13

    invoke-static {v13}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidToString(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 281
    const-string v12, "characteristic"

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v13

    invoke-static {v13}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidToString(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 284
    const-string v12, "properties"

    invoke-static {v0}, Lcom/megster/cordova/ble/central/Helper;->decodeProperties(Landroid/bluetooth/BluetoothGattCharacteristic;)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 287
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getPermissions()I

    move-result v12

    if-lez v12, :cond_2

    .line 288
    const-string v12, "permissions"

    invoke-static {v0}, Lcom/megster/cordova/ble/central/Helper;->decodePermissions(Landroid/bluetooth/BluetoothGattCharacteristic;)Lorg/json/JSONArray;

    move-result-object v13

    invoke-virtual {v2, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 292
    :cond_2
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 294
    .local v5, "descriptorsArray":Lorg/json/JSONArray;
    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getDescriptors()Ljava/util/List;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_5

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/bluetooth/BluetoothGattDescriptor;

    .line 295
    .local v3, "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 296
    .local v4, "descriptorJSON":Lorg/json/JSONObject;
    const-string v13, "uuid"

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattDescriptor;->getUuid()Ljava/util/UUID;

    move-result-object v14

    invoke-static {v14}, Lcom/megster/cordova/ble/central/UUIDHelper;->uuidToString(Ljava/util/UUID;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 297
    const-string v13, "value"

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattDescriptor;->getValue()[B

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 299
    invoke-virtual {v3}, Landroid/bluetooth/BluetoothGattDescriptor;->getPermissions()I

    move-result v13

    if-lez v13, :cond_3

    .line 300
    const-string v13, "permissions"

    invoke-static {v3}, Lcom/megster/cordova/ble/central/Helper;->decodePermissions(Landroid/bluetooth/BluetoothGattDescriptor;)Lorg/json/JSONArray;

    move-result-object v14

    invoke-virtual {v4, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 303
    :cond_3
    invoke-virtual {v5, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 311
    .end local v0    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .end local v1    # "characteristicsArray":Lorg/json/JSONArray;
    .end local v2    # "characteristicsJSON":Lorg/json/JSONObject;
    .end local v3    # "descriptor":Landroid/bluetooth/BluetoothGattDescriptor;
    .end local v4    # "descriptorJSON":Lorg/json/JSONObject;
    .end local v5    # "descriptorsArray":Lorg/json/JSONArray;
    .end local v8    # "service":Landroid/bluetooth/BluetoothGattService;
    .end local v9    # "servicesArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v6

    .line 312
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    .line 315
    .end local v6    # "e":Lorg/json/JSONException;
    :cond_4
    return-object v7

    .line 305
    .restart local v0    # "characteristic":Landroid/bluetooth/BluetoothGattCharacteristic;
    .restart local v1    # "characteristicsArray":Lorg/json/JSONArray;
    .restart local v2    # "characteristicsJSON":Lorg/json/JSONObject;
    .restart local v5    # "descriptorsArray":Lorg/json/JSONArray;
    .restart local v8    # "service":Landroid/bluetooth/BluetoothGattService;
    .restart local v9    # "servicesArray":Lorg/json/JSONArray;
    :cond_5
    :try_start_1
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v12

    if-lez v12, :cond_1

    .line 306
    const-string v12, "descriptors"

    invoke-virtual {v2, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "errorMessage"    # Ljava/lang/String;

    .prologue
    .line 249
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 252
    .local v1, "json":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "name"

    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 253
    const-string v2, "id"

    iget-object v3, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    invoke-virtual {v3}, Landroid/bluetooth/BluetoothDevice;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 254
    const-string v2, "errorMessage"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 259
    :goto_0
    return-object v1

    .line 255
    :catch_0
    move-exception v0

    .line 256
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public connect(Lorg/apache/cordova/CallbackContext;Landroid/app/Activity;Z)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "activity"    # Landroid/app/Activity;
    .param p3, "auto"    # Z

    .prologue
    .line 106
    iput-object p2, p0, Lcom/megster/cordova/ble/central/Peripheral;->currentActivity:Landroid/app/Activity;

    .line 107
    iput-boolean p3, p0, Lcom/megster/cordova/ble/central/Peripheral;->autoconnect:Z

    .line 108
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    .line 110
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->gattConnect()V

    .line 112
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->NO_RESULT:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 113
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 114
    invoke-virtual {p1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 115
    return-void
.end method

.method public disconnect()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 120
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 121
    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 123
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_0

    .line 124
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->disconnect()V

    .line 125
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->close()V

    .line 126
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    .line 128
    :cond_0
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCleanup()V

    .line 129
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->callbackCleanup()V

    .line 130
    return-void
.end method

.method public getDevice()Landroid/bluetooth/BluetoothDevice;
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->device:Landroid/bluetooth/BluetoothDevice;

    return-object v0
.end method

.method public isConnected()Z
    .locals 1

    .prologue
    .line 326
    iget-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    return v0
.end method

.method public isConnecting()Z
    .locals 1

    .prologue
    .line 330
    iget-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    return v0
.end method

.method public isUnscanned()Z
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V
    .locals 5
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 387
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicChanged(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;)V

    .line 388
    const-string v2, "Peripheral"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onCharacteristicChanged "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    iget-object v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->notificationCallbacks:Ljava/util/Map;

    invoke-direct {p0, p2}, Lcom/megster/cordova/ble/central/Peripheral;->generateHashKey(Landroid/bluetooth/BluetoothGattCharacteristic;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/cordova/CallbackContext;

    .line 392
    .local v0, "callback":Lorg/apache/cordova/CallbackContext;
    if-eqz v0, :cond_0

    .line 393
    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;[B)V

    .line 394
    .local v1, "result":Lorg/apache/cordova/PluginResult;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 395
    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 397
    .end local v1    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method

.method public onCharacteristicRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .prologue
    .line 401
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicRead(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    .line 402
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCharacteristicRead "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 404
    monitor-enter p0

    .line 405
    :try_start_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 406
    if-nez p3, :cond_1

    .line 407
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getValue()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success([B)V

    .line 412
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 414
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 416
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 417
    return-void

    .line 409
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error reading "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/bluetooth/BluetoothGattCharacteristic;->getUuid()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 414
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;
    .param p3, "status"    # I

    .prologue
    .line 421
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onCharacteristicWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattCharacteristic;I)V

    .line 422
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onCharacteristicWrite "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 424
    monitor-enter p0

    .line 425
    :try_start_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 426
    if-nez p3, :cond_1

    .line 427
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 432
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    .line 434
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 436
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 437
    return-void

    .line 429
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->writeCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p3}, Lorg/apache/cordova/CallbackContext;->error(I)V

    goto :goto_0

    .line 434
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onConnectionStateChange(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I
    .param p3, "newState"    # I

    .prologue
    const/4 v2, 0x0

    .line 368
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    .line 370
    const/4 v0, 0x2

    if-ne p3, v0, :cond_0

    .line 371
    const-string v0, "Peripheral"

    const-string v1, "onConnectionStateChange CONNECTED"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 372
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 373
    iput-boolean v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connecting:Z

    .line 374
    invoke-virtual {p1}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    .line 383
    :goto_0
    return-void

    .line 377
    :cond_0
    const-string v0, "Peripheral"

    const-string v1, "onConnectionStateChange DISCONNECTED"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 378
    iput-boolean v2, p0, Lcom/megster/cordova/ble/central/Peripheral;->connected:Z

    .line 379
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->peripheralDisconnected()V

    goto :goto_0
.end method

.method public onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "descriptor"    # Landroid/bluetooth/BluetoothGattDescriptor;
    .param p3, "status"    # I

    .prologue
    .line 441
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onDescriptorWrite(Landroid/bluetooth/BluetoothGatt;Landroid/bluetooth/BluetoothGattDescriptor;I)V

    .line 442
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDescriptorWrite "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 444
    return-void
.end method

.method public onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "mtu"    # I
    .param p3, "status"    # I

    .prologue
    .line 168
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mtu="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onMtuChanged(Landroid/bluetooth/BluetoothGatt;II)V

    .line 170
    return-void
.end method

.method public onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V
    .locals 3
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "rssi"    # I
    .param p3, "status"    # I

    .prologue
    .line 449
    invoke-super {p0, p1, p2, p3}, Landroid/bluetooth/BluetoothGattCallback;->onReadRemoteRssi(Landroid/bluetooth/BluetoothGatt;II)V

    .line 450
    monitor-enter p0

    .line 451
    :try_start_0
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 452
    if-nez p3, :cond_1

    .line 453
    invoke-virtual {p0, p2}, Lcom/megster/cordova/ble/central/Peripheral;->updateRssi(I)V

    .line 454
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v0, p2}, Lorg/apache/cordova/CallbackContext;->success(I)V

    .line 459
    :goto_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    .line 461
    :cond_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 462
    invoke-direct {p0}, Lcom/megster/cordova/ble/central/Peripheral;->commandCompleted()V

    .line 463
    return-void

    .line 456
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->readCallback:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error reading RSSI status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0

    .line 461
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V
    .locals 5
    .param p1, "gatt"    # Landroid/bluetooth/BluetoothGatt;
    .param p2, "status"    # I

    .prologue
    const/4 v4, 0x0

    .line 339
    invoke-super {p0, p1, p2}, Landroid/bluetooth/BluetoothGattCallback;->onServicesDiscovered(Landroid/bluetooth/BluetoothGatt;I)V

    .line 344
    if-nez p2, :cond_1

    .line 345
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-virtual {p0, p1}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Landroid/bluetooth/BluetoothGatt;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 346
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/PluginResult;->setKeepCallback(Z)V

    .line 347
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 348
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 349
    iput-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    .line 363
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :goto_0
    return-void

    .line 351
    .restart local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0

    .line 354
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    const-string v1, "Peripheral"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Service discovery failed. status = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_2

    .line 356
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    const-string v2, "Service discovery failed"

    invoke-virtual {p0, v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 357
    iput-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    goto :goto_0

    .line 359
    :cond_2
    iget-object v1, p0, Lcom/megster/cordova/ble/central/Peripheral;->connectCallback:Lorg/apache/cordova/CallbackContext;

    const-string v2, "Service discovery failed"

    invoke-virtual {p0, v2}, Lcom/megster/cordova/ble/central/Peripheral;->asJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V

    .line 360
    invoke-virtual {p0}, Lcom/megster/cordova/ble/central/Peripheral;->disconnect()V

    goto :goto_0
.end method

.method public queueRead(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 755
    new-instance v0, Lcom/megster/cordova/ble/central/BLECommand;

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->READ:I

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/megster/cordova/ble/central/BLECommand;-><init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;I)V

    .line 756
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V

    .line 757
    return-void
.end method

.method public queueReadRSSI(Lorg/apache/cordova/CallbackContext;)V
    .locals 3
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    const/4 v2, 0x0

    .line 776
    new-instance v0, Lcom/megster/cordova/ble/central/BLECommand;

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->READ_RSSI:I

    invoke-direct {v0, p1, v2, v2, v1}, Lcom/megster/cordova/ble/central/BLECommand;-><init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;I)V

    .line 777
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V

    .line 778
    return-void
.end method

.method public queueRegisterNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 765
    new-instance v0, Lcom/megster/cordova/ble/central/BLECommand;

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->REGISTER_NOTIFY:I

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/megster/cordova/ble/central/BLECommand;-><init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;I)V

    .line 766
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V

    .line 767
    return-void
.end method

.method public queueRemoveNotifyCallback(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 2
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;

    .prologue
    .line 770
    new-instance v0, Lcom/megster/cordova/ble/central/BLECommand;

    sget v1, Lcom/megster/cordova/ble/central/BLECommand;->REMOVE_NOTIFY:I

    invoke-direct {v0, p1, p2, p3, v1}, Lcom/megster/cordova/ble/central/BLECommand;-><init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;I)V

    .line 771
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V

    .line 772
    return-void
.end method

.method public queueWrite(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V
    .locals 6
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;
    .param p4, "data"    # [B
    .param p5, "writeType"    # I

    .prologue
    .line 760
    new-instance v0, Lcom/megster/cordova/ble/central/BLECommand;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/megster/cordova/ble/central/BLECommand;-><init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V

    .line 761
    .local v0, "command":Lcom/megster/cordova/ble/central/BLECommand;
    invoke-direct {p0, v0}, Lcom/megster/cordova/ble/central/Peripheral;->queueCommand(Lcom/megster/cordova/ble/central/BLECommand;)V

    .line 762
    return-void
.end method

.method public refreshDeviceCache(Lorg/apache/cordova/CallbackContext;J)V
    .locals 8
    .param p1, "callback"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "timeoutMillis"    # J

    .prologue
    .line 190
    const-string v4, "Peripheral"

    const-string v5, "refreshDeviceCache"

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    const/4 v3, 0x0

    .line 193
    .local v3, "success":Z
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v4, :cond_0

    .line 195
    :try_start_0
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "refresh"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 196
    .local v2, "refresh":Ljava/lang/reflect/Method;
    if-eqz v2, :cond_2

    .line 197
    iget-object v4, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    .line 198
    if-eqz v3, :cond_0

    .line 199
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->refreshCallback:Lorg/apache/cordova/CallbackContext;

    .line 200
    new-instance v1, Landroid/os/Handler;

    invoke-direct {v1}, Landroid/os/Handler;-><init>()V

    .line 201
    .local v1, "handler":Landroid/os/Handler;
    new-instance v4, Lcom/megster/cordova/ble/central/Peripheral$1;

    invoke-direct {v4, p0, p2, p3}, Lcom/megster/cordova/ble/central/Peripheral$1;-><init>(Lcom/megster/cordova/ble/central/Peripheral;J)V

    invoke-virtual {v1, v4, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 217
    .end local v1    # "handler":Landroid/os/Handler;
    .end local v2    # "refresh":Ljava/lang/reflect/Method;
    :cond_0
    :goto_0
    if-nez v3, :cond_1

    .line 218
    const-string v4, "Service refresh failed"

    invoke-virtual {p1, v4}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 220
    :cond_1
    return-void

    .line 210
    .restart local v2    # "refresh":Ljava/lang/reflect/Method;
    :cond_2
    :try_start_1
    const-string v4, "Peripheral"

    const-string v5, "Refresh method not found on gatt"

    invoke-static {v4, v5}, Lorg/apache/cordova/LOG;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 212
    .end local v2    # "refresh":Ljava/lang/reflect/Method;
    :catch_0
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "Peripheral"

    const-string v5, "refreshDeviceCache Failed"

    invoke-static {v4, v5, v0}, Lorg/apache/cordova/LOG;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public requestMtu(I)V
    .locals 3
    .param p1, "mtuValue"    # I

    .prologue
    .line 173
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    if-eqz v0, :cond_0

    .line 174
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestMtu mtu="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 176
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0, p1}, Landroid/bluetooth/BluetoothGatt;->requestMtu(I)Z

    .line 179
    :cond_0
    return-void
.end method

.method public update(I[B)V
    .locals 0
    .param p1, "rssi"    # I
    .param p2, "scanRecord"    # [B

    .prologue
    .line 467
    iput p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    .line 468
    iput-object p2, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingData:[B

    .line 469
    return-void
.end method

.method public updateRssi(I)V
    .locals 0
    .param p1, "rssi"    # I

    .prologue
    .line 472
    iput p1, p0, Lcom/megster/cordova/ble/central/Peripheral;->advertisingRSSI:I

    .line 473
    return-void
.end method
