

// - - - - - - - - - - - - - - - - - - - - - - - 
// DATASYNTH V:1
// Nicholas Felton / Feltron.com
// - - - - - - - - - - - - - - - - - - - - - - - 

// Based on http://code.compartmental.net/minim/ugen_class_ugen.html

// TO DO

// DONE
// - Make Object Oriented
// - Output MIDI


// - - - - - - - - - - - - - - - - - - - - - - - 
// LIBRARIES
// - - - - - - - - - - - - - - - - - - - - - - - 
import ddf.minim.*;
import ddf.minim.ugens.*;
import themidibus.*;


// - - - - - - - - - - - - - - - - - - - - - - - 
// VARIABLES
// - - - - - - - - - - - - - - - - - - - - - - - 
// Audio
Minim minim;
AudioOutput out;
Oscil wave;
MidiBus myBus;
int minFreq = 220;
int maxFreq = 660;
int channel = 1;
int velocity = 100;


// Data
String sourceFile = "Southeastern.tsv";
//String sourceFile = "Barth.tsv";
Table table;
String[][] dataArray;

// Drawing
float hSegments;
float vSegments;
int iteration;
int margin = 10;

// AudioGraph
ArrayList<audioGraph> audioGraphs = new ArrayList<audioGraph>();

// - - - - - - - - - - - - - - - - - - - - - - - 
// SETUP
// - - - - - - - - - - - - - - - - - - - - - - - 
void setup() {
  size(1200, 800);
  myBus = new MidiBus(this, "Real Time Sequencer", "Real Time Sequencer");
  MidiBus.list();
  println();
  intializeAudio();
  initializeGraphs();
  hSegments = float(width)/(dataArray.length-1);
//  myBus = new MidiBus(this, "Processing MIDI", "Processing MIDI");
  myBus = new MidiBus(this, "Bus 1", "Bus 1");
}

// - - - - - - - - - - - - - - - - - - - - - - - 
// DRAW
// - - - - - - - - - - - - - - - - - - - - - - - 
void draw() {
  background(0);
  for (int i=0; i<audioGraphs.size (); i++) {
    iteration = i;
    audioGraphs.get(i).display();
  }
}


















