.class Lcom/megster/cordova/ble/central/Peripheral$1;
.super Ljava/lang/Object;
.source "Peripheral.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/megster/cordova/ble/central/Peripheral;->refreshDeviceCache(Lorg/apache/cordova/CallbackContext;J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/megster/cordova/ble/central/Peripheral;

.field final synthetic val$timeoutMillis:J


# direct methods
.method constructor <init>(Lcom/megster/cordova/ble/central/Peripheral;J)V
    .locals 0
    .param p1, "this$0"    # Lcom/megster/cordova/ble/central/Peripheral;

    .prologue
    .line 201
    iput-object p1, p0, Lcom/megster/cordova/ble/central/Peripheral$1;->this$0:Lcom/megster/cordova/ble/central/Peripheral;

    iput-wide p2, p0, Lcom/megster/cordova/ble/central/Peripheral$1;->val$timeoutMillis:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 204
    const-string v0, "Peripheral"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Waiting "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-wide v2, p0, Lcom/megster/cordova/ble/central/Peripheral$1;->val$timeoutMillis:J

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " milliseconds before discovering services"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    iget-object v0, p0, Lcom/megster/cordova/ble/central/Peripheral$1;->this$0:Lcom/megster/cordova/ble/central/Peripheral;

    iget-object v0, v0, Lcom/megster/cordova/ble/central/Peripheral;->gatt:Landroid/bluetooth/BluetoothGatt;

    invoke-virtual {v0}, Landroid/bluetooth/BluetoothGatt;->discoverServices()Z

    .line 206
    return-void
.end method
