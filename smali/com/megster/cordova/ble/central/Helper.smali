.class public Lcom/megster/cordova/ble/central/Helper;
.super Ljava/lang/Object;
.source "Helper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static decodePermissions(Landroid/bluetooth/BluetoothGattCharacteristic;)Lorg/json/JSONArray;
    .locals 3
    .param p0, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 78
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 79
    .local v1, "props":Lorg/json/JSONArray;
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getPermissions()I

    move-result v0

    .line 81
    .local v0, "permissions":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    .line 82
    const-string v2, "Read"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 85
    :cond_0
    and-int/lit8 v2, v0, 0x10

    if-eqz v2, :cond_1

    .line 86
    const-string v2, "Write"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 89
    :cond_1
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_2

    .line 90
    const-string v2, "ReadEncrypted"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 93
    :cond_2
    and-int/lit8 v2, v0, 0x20

    if-eqz v2, :cond_3

    .line 94
    const-string v2, "WriteEncrypted"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 97
    :cond_3
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_4

    .line 98
    const-string v2, "ReadEncryptedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 101
    :cond_4
    and-int/lit8 v2, v0, 0x40

    if-eqz v2, :cond_5

    .line 102
    const-string v2, "WriteEncryptedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 105
    :cond_5
    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_6

    .line 106
    const-string v2, "WriteSigned"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 109
    :cond_6
    and-int/lit16 v2, v0, 0x100

    if-eqz v2, :cond_7

    .line 110
    const-string v2, "WriteSignedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 113
    :cond_7
    return-object v1
.end method

.method public static decodePermissions(Landroid/bluetooth/BluetoothGattDescriptor;)Lorg/json/JSONArray;
    .locals 3
    .param p0, "descriptor"    # Landroid/bluetooth/BluetoothGattDescriptor;

    .prologue
    .line 119
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 120
    .local v1, "props":Lorg/json/JSONArray;
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattDescriptor;->getPermissions()I

    move-result v0

    .line 122
    .local v0, "permissions":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    .line 123
    const-string v2, "Read"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 126
    :cond_0
    and-int/lit8 v2, v0, 0x10

    if-eqz v2, :cond_1

    .line 127
    const-string v2, "Write"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 130
    :cond_1
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_2

    .line 131
    const-string v2, "ReadEncrypted"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 134
    :cond_2
    and-int/lit8 v2, v0, 0x20

    if-eqz v2, :cond_3

    .line 135
    const-string v2, "WriteEncrypted"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 138
    :cond_3
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_4

    .line 139
    const-string v2, "ReadEncryptedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 142
    :cond_4
    and-int/lit8 v2, v0, 0x40

    if-eqz v2, :cond_5

    .line 143
    const-string v2, "WriteEncryptedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 146
    :cond_5
    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_6

    .line 147
    const-string v2, "WriteSigned"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 150
    :cond_6
    and-int/lit16 v2, v0, 0x100

    if-eqz v2, :cond_7

    .line 151
    const-string v2, "WriteSignedMITM"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 154
    :cond_7
    return-object v1
.end method

.method public static decodeProperties(Landroid/bluetooth/BluetoothGattCharacteristic;)Lorg/json/JSONArray;
    .locals 3
    .param p0, "characteristic"    # Landroid/bluetooth/BluetoothGattCharacteristic;

    .prologue
    .line 26
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 27
    .local v1, "props":Lorg/json/JSONArray;
    invoke-virtual {p0}, Landroid/bluetooth/BluetoothGattCharacteristic;->getProperties()I

    move-result v0

    .line 29
    .local v0, "properties":I
    and-int/lit8 v2, v0, 0x1

    if-eqz v2, :cond_0

    .line 30
    const-string v2, "Broadcast"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 33
    :cond_0
    and-int/lit8 v2, v0, 0x2

    if-eqz v2, :cond_1

    .line 34
    const-string v2, "Read"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 37
    :cond_1
    and-int/lit8 v2, v0, 0x4

    if-eqz v2, :cond_2

    .line 38
    const-string v2, "WriteWithoutResponse"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 41
    :cond_2
    and-int/lit8 v2, v0, 0x8

    if-eqz v2, :cond_3

    .line 42
    const-string v2, "Write"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 45
    :cond_3
    and-int/lit8 v2, v0, 0x10

    if-eqz v2, :cond_4

    .line 46
    const-string v2, "Notify"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 49
    :cond_4
    and-int/lit8 v2, v0, 0x20

    if-eqz v2, :cond_5

    .line 50
    const-string v2, "Indicate"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 53
    :cond_5
    and-int/lit8 v2, v0, 0x40

    if-eqz v2, :cond_6

    .line 55
    const-string v2, "AuthenticateSignedWrites"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 58
    :cond_6
    and-int/lit16 v2, v0, 0x80

    if-eqz v2, :cond_7

    .line 59
    const-string v2, "ExtendedProperties"

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 72
    :cond_7
    return-object v1
.end method
