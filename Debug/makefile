# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)

-include ../makefile.init

RM := del /F /Q
RMDIR := rmdir /S /Q

# All of the sources participating in the build are defined here
-include sources.mk
-include Drivers/STM32F4xx_HAL_Driver/Src/subdir.mk
-include Core/Startup/subdir.mk
-include Core/Src/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets)

BUILD_ARTIFACT_NAME := test
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Output binary file
BIN_FILE := $(BUILD_ARTIFACT_NAME).bin

# Toolchain configuration
CC := arm-none-eabi-gcc
OBJCOPY := arm-none-eabi-objcopy
SIZE := arm-none-eabi-size
OBJDUMP := arm-none-eabi-objdump

# Compiler and linker flags
CFLAGS := -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb
CFLAGS += -Wall -g -std=c11
CFLAGS += -specs=nosys.specs -specs=nano.specs
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -DSTM32F407xx

LDFLAGS := -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb
LDFLAGS += -Wl,-Map=test.map -Wl,--gc-sections
LDFLAGS += -TSTM32F407VGTX_FLASH.ld

# Source files
SRCS := $(wildcard Core/Src/*.c) \
        $(wildcard Core/Startup/*.c) \
        $(wildcard Drivers/STM32F4xx_HAL_Driver/Src/*.c)

# Object files
OBJS := $(SRCS:.c=.o)

# All Target
all: main-build $(BIN_FILE)

# Main-build Target
main-build: $(BUILD_ARTIFACT) secondary-outputs

# Tool invocations
$(BUILD_ARTIFACT): $(OBJS) $(USER_OBJS) $(LD_DEPS) $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJS) $(USER_OBJS) $(LIBS) -o $(BUILD_ARTIFACT) $(LDFLAGS)
	@echo 'Finished building target: $@'
	@echo ' '

$(BIN_FILE): $(BUILD_ARTIFACT)
	$(OBJCOPY) -O binary $< $@
	@echo 'Finished building binary: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) $(SIZE_DEPS)
	$(SIZE) $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

test.list: $(EXECUTABLES) $(OBJDUMP_DEPS)
	$(OBJDUMP) -h -S $(EXECUTABLES) > "test.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RMDIR) ./Drivers/STM32F4xx_HAL_Driver/Src
	-$(RMDIR) ./Core/Startup
	-$(RMDIR) ./Core/Src
	-$(RM) default.size.stdout test.elf test.list test.map $(BIN_FILE)
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
