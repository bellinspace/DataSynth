
// - - - - - - - - - - - - - - - - - - - - - - - 
// AUDIOGRAPH
// - - - - - - - - - - - - - - - - - - - - - - - 

class audioGraph {
  String graphName;
  float[] dataArray;
  float vScale;
  int counter = 0;
  float freq;
  boolean mute;

  audioGraph(String[] dataArray_) {
    graphName = dataArray_[0];
    dataArray = new float[dataArray_.length-1];
    for (int i=0; i<dataArray.length; i++) {
      dataArray[i] = float(dataArray_[i+1]);
    }
    vScale = max(dataArray);
  }

  void display() {
    fill(30);
    rect(0, iteration*vSegments, width, vSegments);
    noFill();
    stroke(100);
    counter++;
    line(0, iteration*vSegments, width, iteration*vSegments);

    for (int i=0; i<dataArray.length; i++) {
      noStroke();
      fill(255);
      float markerSize = hSegments;
      if (i == counter && !mute) {
        fill(255, 255, 0);
        markerSize = 10;
        if (dataArray[i] > -100000000) {
          freq = map( dataArray[i], min(dataArray), max(dataArray), minFreq, maxFreq );
          wave.setFrequency( freq );
          println("Channel: " + channel + " + Frequency: " + int(freq) + " + Velocity: " + velocity);
          myBus.sendNoteOn(channel, int(freq), velocity);
          myBus.sendControllerChange(0, channel, int(freq));
        }
      }
      float xPos = (iteration+1)*vSegments-map(dataArray[i], min(dataArray), max(dataArray), 2*margin, vSegments-2*margin);
      ellipse(i*hSegments, xPos, markerSize, markerSize);
    }

    noStroke();
    fill(255, 255, 0);
    textSize(11);
    text(graphName, margin, iteration*vSegments+2*margin);
    if (counter>dataArray.length) {
      counter = 0;
    }
  }
}





