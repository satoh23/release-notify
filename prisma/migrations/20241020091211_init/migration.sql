-- CreateTable
CREATE TABLE "Users" (
    "id" TEXT NOT NULL,
    "line_id" VARCHAR(255) NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Technologies" (
    "id" TEXT NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "url" VARCHAR(255) NOT NULL,
    "version" VARCHAR(15) NOT NULL,

    CONSTRAINT "Technologies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notifications" (
    "usersId" TEXT NOT NULL,
    "technologiesId" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Users_line_id_key" ON "Users"("line_id");

-- CreateIndex
CREATE INDEX "Users_line_id_idx" ON "Users"("line_id");

-- CreateIndex
CREATE UNIQUE INDEX "Technologies_name_key" ON "Technologies"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Technologies_url_key" ON "Technologies"("url");

-- CreateIndex
CREATE INDEX "Technologies_name_idx" ON "Technologies"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Notifications_usersId_technologiesId_key" ON "Notifications"("usersId", "technologiesId");

-- AddForeignKey
ALTER TABLE "Notifications" ADD CONSTRAINT "Notifications_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notifications" ADD CONSTRAINT "Notifications_technologiesId_fkey" FOREIGN KEY ("technologiesId") REFERENCES "Technologies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
