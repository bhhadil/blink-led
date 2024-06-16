# Nom du fichier cible
TARGET = firmware

# Chemins des outils
CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy
SIZETOOL = arm-none-eabi-size

# Options de compilation
CFLAGS = -mcpu=cortex-m4 -mthumb -O2 -Wall -fdata-sections -ffunction-sections -DSTM32F407xx
LDFLAGS = -Tstm32_flash.ld -mcpu=cortex-m4 -mthumb -Wl,--gc-sections

# Répertoires d'inclusion
INCLUDES = -IInc -IDrivers/STM32F4xx_HAL_Driver/Inc -IDrivers/CMSIS/Include -IDrivers/CMSIS/Device/ST/STM32F4xx/Include

# Fichiers sources
SRCS = Src/main.c Src/stm32f4xx_hal_msp.c Src/stm32f4xx_it.c Src/system_stm32f4xx.c

# Fichiers objets générés
OBJS = $(SRCS:.c=.o)

# Règle de construction
all: $(TARGET).bin

# Règle de construction des objets
%.o: %.c
    $(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

# Règle de construction de l'exécutable ELF
$(TARGET).elf: $(OBJS)
    $(CC) $(CFLAGS) $(OBJS) -o $@ $(LDFLAGS)

# Règle de construction du fichier binaire
$(TARGET).bin: $(TARGET).elf
    $(OBJCOPY) -O binary $< $@

# Affichage de la taille du fichier binaire
size: $(TARGET).elf
    $(SIZETOOL) $<

# Règle de nettoyage
clean:
    rm -f $(TARGET).elf $(TARGET).bin $(OBJS)

.PHONY: all clean size
