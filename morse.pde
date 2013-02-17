const int ledPin = 13; // the pin that the LED is attached to
int incomingByte;    // a variable to read incoming serial data into

void setup() {
	// initialize serial communication:
	Serial.begin(9600);
	// initialize the LED pin as an output:
	pinMode(ledPin, OUTPUT);
}

void loop() {
	// see if there's incoming serial data:
	if (Serial.available() > 0) {
		// read the oldest byte in the serial buffer:
		incomingByte = Serial.read();
		signalChar(incomingByte);
	}
}

// Signal the character in morse code
void signalChar(char c) {
	const char * morse;
	morse = asciiToMorse(c);
	int i = 0;
	while(morse[i] != '\0') {
		showMorse(morse[i]);
		delay(500);
		i++;
	}
	delay(1000);
}

// Show a dot or a dash
void showMorse(char m) {
	if (m == '.') {
		digitalWrite(ledPin, HIGH);
		delay(100);
		digitalWrite(ledPin, LOW);
	} else if (m == '-') {
		digitalWrite(ledPin, HIGH);
		delay(300);
		digitalWrite(ledPin, LOW);
	}
}

// Convert an ascii char to morse code
const char * asciiToMorse(char c) {
	if (c < 'A')
		return "";
	if (c > 'z')
		return "";
	if (c < 'a')
		c += 32;

	switch (c) {
		case 'a':
			return ".-";
		case 'b':
			return "-...";
		case 'c':
			return "-.-.";
		case 'd':
			return "-..";
		case 'e':
			return ".";
		case 'f':
			return "..-.";
		case 'g':
			return "--.";
		case 'h':
			return "....";
		case 'i':
			return "..";
		case 'j':
			return ".---";
		case 'k':
			return "-.-";
		case 'l':
			return ".-..";
		case 'm':
			return "--";
		case 'n':
			return "-.";
		case 'o':
			return "---";
		case 'p':
			return ".--.";
		case 'q':
			return "--.-";
		case 'r':
			return ".-.";
		case 's':
			return "...";
		case 't':
			return "-";
		case 'u':
			return "..-";
		case 'v':
			return "...-";
		case 'w':
			return ".--";
		case 'x':
			return "-..-";
		case 'y':
			return "-.--";
		case 'z':
			return "--..";
	}
}
