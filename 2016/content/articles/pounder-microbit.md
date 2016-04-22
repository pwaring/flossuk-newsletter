# Micro:bit finally reaches UK children

## Les Pounder

The BBC’s micro:bit is finally making its way into the hands of eager children across the UK and I have seen reports of teachers getting to grips with this new single board microcontroller ahead of their classes. One million children in Year 7, the first year of secondary education in the United Kingdom, will receive a free micro:bit board with which they can learn new skills. Schools will also be able to purchase more boards.

The micro:bit is a powerful platform for experimentation and offers a 32-Bit ARM Cortex M0 CPU, which includes Bluetooth 4 and Bluetooth Low Energy (LE) wireless connectivity. Micro:bit also comes with an accelerometer which can be used to detect movement and gestures, a compass to detect direction, input comes in the form of two programmable buttons, lastly there is an LED matrix of 25 LEDs which can be used as a basic form of output.

The micro:bit is designed to be used with crocodile clips, attached to five GPIO (General Purpose Input Output) pins present on the board. However there are more GPIO pins available thanks to the 20 pin edge connector. Using these pins requires a breakout board and the leading provider for these are [Kitronik](https://www.kitronik.co.uk/bbc-micro-bit-accessories.html)[^kitronik] who have been working with the BBC to create a range of products to support the micro:bit. The micro:bit Prototyping System is a great starting point. I recently picked one of these up and it has helped my prototyping immensely. The Prototyping System provides a means to break out all of the GPIO pins and use them on a breadboard. This means that I can use the micro:bit with existing cheap components, that I have plenty of thanks to other boards such as the Arduino and Raspberry Pi.

Programming the micro:bit is possible in multiple languages[^multiple-languages], with Microsoft offering their own version of a Block based editor. This editor is very similar to Blockly and offers an easy to use introduction to programming the board. The next language has a direct link to the Block Editor. Touch Develop is a typed language that has an unusual, almost tablet like interface that enables children to develop their code from the Block Editor and turn it into a “real” language. Code created in the Block Editor can be converted to Touch Develop to illustrate the link between the languages. It is also possible to program the micro:bit using JavaScript, specifically with Code Kingdoms and this would be a great way to introduce JavaScript as a general purpose language, and not just as a web development tool.

But the most exciting language on the micro:bit is something that has been grown and supported by a community of makers, hackers, coders and thinkers, and that language is Python.

Python has been chosen as the language to teach in schools across the UK, largely due to the Raspberry Pi but also thanks to a community who have lowered the barrier for entry and enabled anyone to write Python. The Python Software Foundation (PSF) were approached via Nicholas Tollervey to create a Python framework for the micro:bit. Thanks in part to the [micro python](https://micropython.org/) project[^micro-python] headed by Damien George, which offers an implementation of Python 3 for micro-controllers. The result of this consultation with the PSF community are two fold. Firstly we have a web implementation on the micro:bit website, here we can write Python code in the browser and download it to the micro:bit. Secondly we have [mu](https://github.com/ntoll/mu),[^mu] a Python editor for the micro:bit that is designed for children to get coding quickly. Mu has a standard editor window into which we can type our code. By inserting our micro:bit into a computer we see the device appear as a USB flash storage device. Our code can be uploaded to the micro:bit and it will auto reset to start the new code. Also present with mu is REPL (Read Evaluate Print Loop) a method of connecting to the micro:bit via a USB serial interface, using this we can easily control the micro:bit in an interactive session. This is very handy for quick tests and hacks.

The micro:bit is an excellent piece of kit and will prove to be an interesting introduction for children and adults looking to get started with physical computing.I have it on good authority that the micro:bit will be on sale to the public this year, but no firm dates as yet.

![Microbit](images/microbit-print-ready.jpg)

[^kitronik]: https://www.kitronik.co.uk/bbc-micro-bit-accessories.html

[^multiple-languages]: https://www.microbit.co.uk/create-code

[^micro-python]: https://micropython.org/

[^mu]: https://github.com/ntoll/mu
