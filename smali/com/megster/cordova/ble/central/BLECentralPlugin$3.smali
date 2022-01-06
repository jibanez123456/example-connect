.class Lcom/megster/cordova/ble/central/BLECentralPlugin$3;
.super Ljava/lang/Object;
.source "BLECentralPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/megster/cordova/ble/central/BLECentralPlugin;->findLowEnergyDevices(Lorg/apache/cordova/CallbackContext;[Ljava/util/UUID;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;


# direct methods
.method constructor <init>(Lcom/megster/cordova/ble/central/BLECentralPlugin;)V
    .locals 0
    .param p1, "this$0"    # Lcom/megster/cordova/ble/central/BLECentralPlugin;

    .prologue
    .line 598
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$3;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 601
    const-string v0, "BLEPlugin"

    const-string v1, "Stopping Scan"

    invoke-static {v0, v1}, Lorg/apache/cordova/LOG;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 602
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$3;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    iget-object v0, v0, Lcom/megster/cordova/ble/central/BLECentralPlugin;->bluetoothAdapter:Landroid/bluetooth/BluetoothAdapter;

    iget-object v1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$3;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    invoke-virtual {v0, v1}, Landroid/bluetooth/BluetoothAdapter;->stopLeScan(Landroid/bluetooth/BluetoothAdapter$LeScanCallback;)V

    .line 603
    return-void
.end method
