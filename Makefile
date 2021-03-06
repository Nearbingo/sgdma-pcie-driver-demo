obj-m:=altera_drv.o
#obj-m := dma_test.o


KDIR  := /lib/modules/$(shell uname -r)/build
PWD   := $(shell pwd)

default:
	$(MAKE) -C $(KDIR) M=$(PWD) modules

clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean

test: default
	sudo dmesg -c && sudo rmmod altera_drv && sudo insmod altera_drv.ko && sudo dmesg -c

dma_test: default
	sudo dmesg -c && sudo rmmod dma_test && sudo insmod dma_test.ko && sudo dmesg -c


.PHONY: test dma_test
