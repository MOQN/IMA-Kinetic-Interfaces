// IMA NYU Shanghai
// Kinetic Interfaces
// MOQN
// Nov 12 2016

import gab.opencv.*;
import blobDetection.*;

OpenCV opencvImg;
ArrayList<Contour> contours;

BlobDetection theBlobDetection;
PImage blobImg;

void setup() {
  size(1000, 600, P3D);
  setupPeasyCam();
  setupGui();
  setupKinect();

  blobImg = new PImage(51*2, 42*2); 
  theBlobDetection = new BlobDetection(blobImg.width, blobImg.height);
  theBlobDetection.setPosDiscrimination(true);
  theBlobDetection.setThreshold(0.2f); // will detect bright areas whose luminosity > 0.2f;
}


void draw() {
  background(0);
  drawKinect();
  if (guiToggle) drawGui();

  // "drawOpenCV();" is added in the "drawDepthImage()" function at Gui tab
}


void keyPressed() {
  if (key == ' ') guiToggle = !guiToggle;
}


void drawOpenCV() {
  opencvImg = new OpenCV(this, depthImg);

  opencvImg.blur(5);
  opencvImg.threshold(10);

  // Reduce noise - Dilate and erode to close holes
  opencvImg.dilate();
  opencvImg.erode();

  blobImg.copy(opencvImg.getOutput(), 0, 0, opencvImg.width, opencvImg.height, 
    0, 0, blobImg.width, blobImg.height);
  theBlobDetection.computeBlobs(blobImg.pixels);
  drawBlobsAndEdges(depthImg.width, depthImg.height, true, true);
}


void drawBlobsAndEdges(int w, int h, boolean drawBlobs, boolean drawEdges)
{
  noFill();
  Blob b;
  EdgeVertex eA, eB;
  for (int n=0; n<theBlobDetection.getBlobNb(); n++)
  {
    b=theBlobDetection.getBlob(n);
    if (b!=null)
    {
      // Edges
      if (drawEdges)
      {
        strokeWeight(3);
        stroke(0, 255, 0);
        for (int m=0; m<b.getEdgeNb(); m++)
        {
          eA = b.getEdgeVertexA(m);
          eB = b.getEdgeVertexB(m);
          if (eA !=null && eB !=null)
            line(
              eA.x*w, eA.y*h, 
              eB.x*w, eB.y*h
              );
        }
      }
      // Blobs
      if (drawBlobs)
      {
        strokeWeight(1);
        stroke(255, 0, 0);
        rect(
          b.xMin*w, b.yMin*h, 
          b.w*w, b.h*h
          );
        fill(255);
        textSize(10);
        text(n,b.xMin*w+10, b.yMin*h+20);
        noFill();
      }
    }
  }
}