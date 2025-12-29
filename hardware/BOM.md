# Shipometer Hardware Bill of Materials

| Qty | Description                                                   | Part Number / Spec | Notes / Link | Approx. Unit Cost (bulk) |
|-----|---------------------------------------------------------------|--------------------|--------------|--------------------------|
| 1   | Raspberry Pi 5 8GB                                            | Raspberry Pi 5 | Official board - fluttershy | - |
| 1   | dAISy 2+ AIS USB receiver                                     | dAISy 2+ | USB dongle, black aluminum enclosure typical | - |
| 1   | FlightAware Pro Stick Plus ADS-B receiver                     | FA-PROSTICKPLUS | Or equivalent USB dongle | - |
| 1   | Sparkfun breakout for u-blox ZED-F9R GPS module (with IMU)    | ZED-F9R | UART + PPS wired to GPIO | Datasheet: https://www.u-blox.com/en/product/zed-f9r-module |
| 1   | Bosch BME280 sensor breakout                                  | BME280 | SPI on GPIO | Datasheet: https://www.bosch-sensortec.com/products/environmental-sensors/humidity-sensors-bme280/ |
| 1   | Optional cooling fan (for enclosed case)                      | CoolCox CC3007H05S (or equiv.) | 30x30x7mm, 5V, 4-pin JST-SH 1.0mm pitch (PWM + tach), ~8000 RPM max, 2.79 CFM | Matches official Pi 5 case fan; Datasheet: https://www.coolcox.com/products/pdf/CC3007.pdf |
| 4   | M2.5 brass/hex standoffs (various lengths, e.g., 11mm + 20mm) | Generic M2.5 F/F or M/F | For Pi mounting + HAT spacing | Jellybean; e.g., from assortment kits |
| 8-16| M2.5 screws (e.g., 6-12mm pan head)                           | Generic M2.5 stainless | For securing board, lid, standoffs | - |
| 4   | Silicone feet or bumpers                                      | Generic 8-10mm dia. | Anti-slip for desk/cabin mount | - |
| 1   | Custom 3D-printed case                                        | Your OpenSCAD design | PLA/PETG/ABS recommended for durability | - |
| Misc| Antennas (GPS mushroom, 1090MHz ADS-B, 161-162MHz AIS)        | Various | Roof-mounted when landlocked | - |
| Misc| Cables (USB extensions, UART jumpers, PPS wire)               | - | As needed for clean routing | - |
