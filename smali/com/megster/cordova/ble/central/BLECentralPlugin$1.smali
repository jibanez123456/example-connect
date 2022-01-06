.class Lcom/megster/cordova/ble/central/BLECentralPlugin$1;
.super Ljava/util/Hashtable;
.source "BLECentralPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/megster/cordova/ble/central/BLECentralPlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/Hashtable",
        "<",
        "Ljava/lang/Integer;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;


# direct methods
.method constructor <init>(Lcom/megster/cordova/ble/central/BLECentralPlugin;)V
    .locals 2
    .param p1, "this$0"    # Lcom/megster/cordova/ble/central/BLECentralPlugin;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;->this$0:Lcom/megster/cordova/ble/central/BLECentralPlugin;

    invoke-direct {p0}, Ljava/util/Hashtable;-><init>()V

    .line 107
    const/16 v0, 0xa

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "off"

    invoke-virtual {p0, v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    const/16 v0, 0xd

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "turningOff"

    invoke-virtual {p0, v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 109
    const/16 v0, 0xc

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "on"

    invoke-virtual {p0, v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    const/16 v0, 0xb

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const-string v1, "turningOn"

    invoke-virtual {p0, v0, v1}, Lcom/megster/cordova/ble/central/BLECentralPlugin$1;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    return-void
.end method
