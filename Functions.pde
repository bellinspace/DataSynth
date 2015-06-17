
// - - - - - - - - - - - - - - - - - - - - - - - 
// FUNCTIONS
// - - - - - - - - - - - - - - - - - - - - - - - 

void intializeAudio() {
  minim = new Minim(this);
  out = minim.getLineOut();
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  wave.patch( out );
}

// - - - - - - - - - - - - - - - - - - - - - - - 

void initializeGraphs() {
  table = loadTable(sourceFile);
  println("Columns: " + table.getColumnCount());
  println("Rows: " + table.getRowCount());
  dataArray = new String[table.getRowCount()][table.getColumnCount()];
  // Initialize audioGraphs
  for (int i=3; i<table.getColumnCount (); i++) { // index at 3 to skip date, time, etc
    audioGraphs.add(new audioGraph(table.getStringColumn(i)));
  }

  //    audioGraphs.add(new audioGraph(table.getStringColumn(3)));


  vSegments = float(height)/audioGraphs.size();
}

// - - - - - - - - - - - - - - - - - - - - - - - 

void keyPressed()
{ 
  switch( key )
  {
  case '1': 
    wave.setWaveform( Waves.SINE );
    break;
  case '2':
    wave.setWaveform( Waves.TRIANGLE );
    break;
  case '3':
    wave.setWaveform( Waves.SAW );
    break;
  case '4':
    wave.setWaveform( Waves.SQUARE );
    break;
  case '5':
    wave.setWaveform( Waves.QUARTERPULSE );
    break;
  default: 
    break;
  }
}

// - - - - - - - - - - - - - - - - - - - - - - - 

void mousePressed() {

  int muteIndex = int(mouseY/vSegments);
  println(muteIndex);
  audioGraphs.get(muteIndex).mute = !audioGraphs.get(muteIndex).mute;

}







