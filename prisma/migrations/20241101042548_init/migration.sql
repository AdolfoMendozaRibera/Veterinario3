/*
  Warnings:

  - Made the column `ReservacionID` on table `servicio` required. This step will fail if there are existing NULL values in that column.

*/
-- AlterEnum
-- This migration adds more than one value to an enum.
-- With PostgreSQL versions 11 and earlier, this is not possible
-- in a single migration. This can be worked around by creating
-- multiple migrations, each migration adding only one value to
-- the enum.


ALTER TYPE "tipoaccionbitacora_Accion" ADD VALUE 'CrearVacuna';
ALTER TYPE "tipoaccionbitacora_Accion" ADD VALUE 'ListarVacunas';

-- AlterTable
ALTER TABLE "servicio" ALTER COLUMN "ReservacionID" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "consultamedica" ADD CONSTRAINT "consultamedica_ServicioID_fkey" FOREIGN KEY ("ServicioID") REFERENCES "servicio"("ServicioID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mascota" ADD CONSTRAINT "mascota_RazaID_fkey" FOREIGN KEY ("RazaID") REFERENCES "raza"("RazaID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "peluqueria" ADD CONSTRAINT "peluqueria_ServicioID_fkey" FOREIGN KEY ("ServicioID") REFERENCES "servicio"("ServicioID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "reservacion" ADD CONSTRAINT "reservacion_UsuarioID_fkey" FOREIGN KEY ("UsuarioID") REFERENCES "usuario"("UsuarioID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "servicio" ADD CONSTRAINT "servicio_ReservacionID_fkey" FOREIGN KEY ("ReservacionID") REFERENCES "reservacion"("ReservacionID") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "servicio" ADD CONSTRAINT "servicio_MascotaID_fkey" FOREIGN KEY ("MascotaID") REFERENCES "mascota"("MascotaID") ON DELETE RESTRICT ON UPDATE CASCADE;
