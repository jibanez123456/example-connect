.class Lcom/megster/cordova/ble/central/BLECommand;
.super Ljava/lang/Object;
.source "BLECommand.java"


# static fields
.field public static READ:I

.field public static READ_RSSI:I

.field public static REGISTER_NOTIFY:I

.field public static REMOVE_NOTIFY:I


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private characteristicUUID:Ljava/util/UUID;

.field private data:[B

.field private serviceUUID:Ljava/util/UUID;

.field private type:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const/16 v0, 0x2710

    sput v0, Lcom/megster/cordova/ble/central/BLECommand;->READ:I

    .line 14
    const/16 v0, 0x2711

    sput v0, Lcom/megster/cordova/ble/central/BLECommand;->REGISTER_NOTIFY:I

    .line 15
    const/16 v0, 0x2712

    sput v0, Lcom/megster/cordova/ble/central/BLECommand;->REMOVE_NOTIFY:I

    .line 16
    const/16 v0, 0x2713

    sput v0, Lcom/megster/cordova/ble/central/BLECommand;->READ_RSSI:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;I)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;
    .param p4, "type"    # I

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECommand;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 29
    iput-object p2, p0, Lcom/megster/cordova/ble/central/BLECommand;->serviceUUID:Ljava/util/UUID;

    .line 30
    iput-object p3, p0, Lcom/megster/cordova/ble/central/BLECommand;->characteristicUUID:Ljava/util/UUID;

    .line 31
    iput p4, p0, Lcom/megster/cordova/ble/central/BLECommand;->type:I

    .line 32
    return-void
.end method

.method public constructor <init>(Lorg/apache/cordova/CallbackContext;Ljava/util/UUID;Ljava/util/UUID;[BI)V
    .locals 0
    .param p1, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .param p2, "serviceUUID"    # Ljava/util/UUID;
    .param p3, "characteristicUUID"    # Ljava/util/UUID;
    .param p4, "data"    # [B
    .param p5, "type"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECommand;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 36
    iput-object p2, p0, Lcom/megster/cordova/ble/central/BLECommand;->serviceUUID:Ljava/util/UUID;

    .line 37
    iput-object p3, p0, Lcom/megster/cordova/ble/central/BLECommand;->characteristicUUID:Ljava/util/UUID;

    .line 38
    iput-object p4, p0, Lcom/megster/cordova/ble/central/BLECommand;->data:[B

    .line 39
    iput p5, p0, Lcom/megster/cordova/ble/central/BLECommand;->type:I

    .line 40
    return-void
.end method


# virtual methods
.method public getCallbackContext()Lorg/apache/cordova/CallbackContext;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECommand;->callbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method public getCharacteristicUUID()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECommand;->characteristicUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECommand;->data:[B

    return-object v0
.end method

.method public getServiceUUID()Ljava/util/UUID;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECommand;->serviceUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/megster/cordova/ble/central/BLECommand;->type:I

    return v0
.end method
