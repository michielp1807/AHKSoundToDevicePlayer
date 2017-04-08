using System;
using System.Collections;
using System.Collections.Generic;
using IrrKlang;

namespace CSharp._01.HelloWorld
{
	class Class1
	{
		[STAThread]
		static void Main(string[] args)
		{
            string soundToPlay = "Airhorn.wav";
            string currentDir = Environment.CurrentDirectory;

            if (args.Length < 1)
            {
                Console.WriteLine("Please specify which sound to play.");
            }
            else
            {
                soundToPlay = args[0];
            }

            Console.WriteLine("Playing {0}", soundToPlay);

            //Get the list of installed sound devices. 
            IrrKlang.ISoundDeviceList sdl = new IrrKlang.ISoundDeviceList(IrrKlang.SoundDeviceListType.PlaybackDevice);
            // start the sound engine
            int AudioDevice = 0;
            if (args.Length > 1) {
                int j;
                if (Int32.TryParse(args[1], out j))
                    AudioDevice = j;
                else
                    Console.WriteLine("String could not be parsed.");
            }
            ISoundEngine engine = new ISoundEngine(IrrKlang.SoundOutputDriver.AutoDetect,
                IrrKlang.SoundEngineOptionFlag.DefaultOptions,
                sdl.getDeviceID(AudioDevice));

            engine.Play2D("" + currentDir + "\\" + soundToPlay);

            do
            {
                //don't close me yet
            }
            while (engine.IsCurrentlyPlaying("" + currentDir + "\\" + soundToPlay));
        }
		
		// some simple function for reading keys from the console
		[System.Runtime.InteropServices.DllImport("msvcrt")]
		static extern int _getch();
	}
}
