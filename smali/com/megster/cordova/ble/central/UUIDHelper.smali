.class public Lcom/megster/cordova/ble/central/UUIDHelper;
.super Ljava/lang/Object;
.source "UUIDHelper.java"


# static fields
.field public static final UUID_BASE:Ljava/lang/String; = "0000XXXX-0000-1000-8000-00805f9b34fb"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static uuidFromString(Ljava/lang/String;)Ljava/util/UUID;
    .locals 2
    .param p0, "uuid"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    .line 30
    const-string v0, "0000XXXX-0000-1000-8000-00805f9b34fb"

    const-string v1, "XXXX"

    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 32
    :cond_0
    invoke-static {p0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method public static uuidToString(Ljava/util/UUID;)Ljava/lang/String;
    .locals 5
    .param p0, "uuid"    # Ljava/util/UUID;

    .prologue
    .line 37
    invoke-virtual {p0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    .local v0, "longUUID":Ljava/lang/String;
    const-string v3, "0000(.{4})-0000-1000-8000-00805f9b34fb"

    const/4 v4, 0x2

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 39
    .local v2, "pattern":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    .line 40
    .local v1, "matcher":Ljava/util/regex/Matcher;
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 42
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    .line 44
    .end local v0    # "longUUID":Ljava/lang/String;
    :cond_0
    return-object v0
.end method
