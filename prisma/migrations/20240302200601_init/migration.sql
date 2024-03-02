-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "socketId" TEXT,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "admin" BOOLEAN NOT NULL DEFAULT false
);

-- CreateTable
CREATE TABLE "Message" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "content" TEXT NOT NULL,
    "content_type" TEXT NOT NULL,
    "sender_id" TEXT NOT NULL,
    "conversation_id" TEXT NOT NULL,
    CONSTRAINT "Message_sender_id_fkey" FOREIGN KEY ("sender_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Message_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "Conversation" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Conversation" (
    "id" TEXT NOT NULL PRIMARY KEY
);

-- CreateTable
CREATE TABLE "Purchase" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "conversation_id" TEXT,
    "vin" TEXT,
    "color" TEXT,
    "email" TEXT,
    "state" TEXT,
    "name" TEXT,
    "lastName" TEXT,
    "address" TEXT,
    "city" TEXT,
    "houseType" TEXT,
    "zip" TEXT,
    "phone" TEXT,
    "driverLicense" TEXT,
    "hasVehicleInSurance" TEXT,
    "wantToGetVehicleInsurance" TEXT,
    "vehicleInsurance" TEXT,
    "details" TEXT,
    "isTruck" TEXT,
    "total" INTEGER DEFAULT 0,
    "continuePurchase" BOOLEAN,
    "completed" BOOLEAN DEFAULT false,
    "user_id" TEXT NOT NULL,
    "options" TEXT,
    "cancelled" BOOLEAN DEFAULT false,
    "failedTries" INTEGER DEFAULT 0,
    "image" TEXT,
    "vehicleType" TEXT,
    "buyingType" TEXT,
    "paypalPaymentId" TEXT,
    "insuranceType" TEXT,
    CONSTRAINT "Purchase_conversation_id_fkey" FOREIGN KEY ("conversation_id") REFERENCES "Conversation" ("id") ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT "Purchase_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Purchasewithoutconversation" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "vin" TEXT,
    "color" TEXT,
    "email" TEXT,
    "state" TEXT,
    "name" TEXT,
    "lastName" TEXT,
    "address" TEXT,
    "city" TEXT,
    "houseType" TEXT,
    "zip" TEXT,
    "phone" TEXT,
    "driverLicense" TEXT,
    "hasVehicleInSurance" TEXT,
    "wantToGetVehicleInsurance" TEXT,
    "vehicleInsurance" TEXT,
    "details" TEXT,
    "isTruck" TEXT,
    "total" INTEGER DEFAULT 0,
    "continuePurchase" BOOLEAN,
    "completed" BOOLEAN DEFAULT false,
    "user_id" TEXT NOT NULL,
    "options" TEXT,
    "cancelled" BOOLEAN DEFAULT false,
    "failedTries" INTEGER DEFAULT 0,
    "image" TEXT,
    "vehicleType" TEXT,
    "buyingType" TEXT,
    "paypalPaymentId" TEXT,
    "insuranceType" TEXT,
    CONSTRAINT "Purchasewithoutconversation_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Purchasevisitor" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "vin" TEXT,
    "color" TEXT,
    "email" TEXT,
    "state" TEXT,
    "name" TEXT,
    "lastName" TEXT,
    "address" TEXT,
    "city" TEXT,
    "houseType" TEXT,
    "zip" TEXT,
    "phone" TEXT,
    "driverLicense" TEXT,
    "hasVehicleInSurance" TEXT,
    "wantToGetVehicleInsurance" TEXT,
    "vehicleInsurance" TEXT,
    "details" TEXT,
    "isTruck" TEXT,
    "total" INTEGER DEFAULT 0,
    "continuePurchase" BOOLEAN,
    "completed" BOOLEAN DEFAULT false,
    "options" TEXT,
    "cancelled" BOOLEAN DEFAULT false,
    "failedTries" INTEGER DEFAULT 0,
    "image" TEXT,
    "vehicleType" TEXT,
    "buyingType" TEXT,
    "paypalPaymentId" TEXT,
    "insuranceType" TEXT
);

-- CreateTable
CREATE TABLE "PlateDetailsCodes" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "tagName" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "tagIssueDate" DATETIME NOT NULL,
    "tagExpirationDate" DATETIME NOT NULL,
    "purchasedOrLeased" TEXT NOT NULL,
    "customerType" TEXT NOT NULL,
    "transferPlate" TEXT NOT NULL,
    "vin" TEXT NOT NULL,
    "vehicleYear" TEXT NOT NULL,
    "vehicleMake" TEXT NOT NULL,
    "vehicleModel" TEXT NOT NULL,
    "vehicleBodyStyle" TEXT NOT NULL,
    "vehicleColor" TEXT NOT NULL,
    "vehicleGVW" TEXT NOT NULL,
    "dealerLicenseNumber" TEXT NOT NULL,
    "dealerName" TEXT NOT NULL,
    "dealerAddress" TEXT NOT NULL,
    "dealerPhone" TEXT NOT NULL,
    "dealerType" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "hasBarcode" BOOLEAN NOT NULL,
    "hasQRCode" BOOLEAN NOT NULL
);

-- CreateTable
CREATE TABLE "_ConversationToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL,
    CONSTRAINT "_ConversationToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "Conversation" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ConversationToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "User" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "_ConversationToUser_AB_unique" ON "_ConversationToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ConversationToUser_B_index" ON "_ConversationToUser"("B");
