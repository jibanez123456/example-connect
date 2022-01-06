.class Lcom/megster/cordova/ble/central/BLECentralPlugin$2;
.super Landroid/content/BroadcastReceiver;
.source "BLECentralPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/megster/cordova/ble/central/BLECentralPlugin;->addStateListener()V
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
    .line 357
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$2;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 360
    iget-object v0, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$2;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    invoke-static {v0, p2}, Lcom/megster/cordova/ble/central/BLECentralPlugin;->access$000(Lcom/megster/cordova/ble/central/BLECentralPlugin;Landroid/content/Intent;)V

    .line 361
    return-void
.end method
