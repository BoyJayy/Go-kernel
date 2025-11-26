package main

import "unsafe"

const (
	vgaBufferAddr = 0xB8000
	screenWidth   = 80
	screenHeight  = 25
)

var (
	vga = (*[screenWidth * screenHeight * 2]uint8)(
		unsafe.Pointer(uintptr(vgaBufferAddr)),
	)
)

func main() {
	clearScreen()
	writeString(0, 0, "darova ya yedro na go menya sozdal boyjik")
	for {
		// беск чтоб ядро не ретeрнулось
	}
}

func clearScreen() {
	for i := 0; i < screenWidth*screenHeight; i++ {
		vga[2*i] = ' '
		vga[2*i+1] = 0x07
	}
}

func writeString(x, y int, s string) {
	pos := (y*screenWidth + x) * 2
	for i := 0; i < len(s) && x+i < screenWidth; i++ {
		vga[pos+2*i] = s[i]
		vga[pos+2*i+1] = 0x0F
	}
}
