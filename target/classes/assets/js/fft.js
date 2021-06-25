"use strict";

function ajaxGetArrayBuffer(url, onLoad, onError)
{
    var ajax = new XMLHttpRequest();
    ajax.onload = function(){onLoad(this);} //function(){onLoad(this);}
    ajax.onerror = function(){console.log("ajax request failed to: "+url);onError(this);}
    ajax.open("GET",url,true);
    ajax.responseType = 'arraybuffer';
    ajax.send();
}

var complex_t = function(real, imag)
{
    this.real = real;
    this.imag = imag;
    return this;
}

complex_t.prototype.toString = function()
{
    return "<"+this.real + " " + this.imag + "j>";
}

complex_t.prototype.scalarDiv = function(scalar)
{
    this.real /= scalar;
    this.imag /= scalar;
    return this;
}

// returns an array of complex values
function dft( complexArray )
{
    var nSamples = complexArray.length;
    var result = [];

    for (var outIndex=0; outIndex<nSamples; outIndex++)
    {
        var sumReal=0, sumImag=0;
        for (var inIndex=0; inIndex<nSamples; inIndex++)
        {
            var angle = 2 * Math.PI * inIndex * outIndex / nSamples;
            var cosA = Math.cos(angle);
            var sinA = Math.sin(angle);
            //sumReal += complexArray[inIndex].real*Math.cos(angle) + complexArray[inIndex].imag*Math.sin(angle);
            //sumImag += -complexArray[inIndex].real*Math.sin(angle) + complexArray[inIndex].imag*Math.cos(angle);
            sumReal += complexArray[inIndex].real*cosA + complexArray[inIndex].imag*sinA;
            sumImag += -complexArray[inIndex].real*sinA + complexArray[inIndex].imag*cosA;
        }
        result.push( new complex_t(sumReal, sumImag) );
    }
    return result;
}

function inverseDft( complexArray )
{
    var nSamples = complexArray.length;
    var result = [];

    for (var outIndex=0; outIndex<nSamples; outIndex++)
    {
        var sumReal=0, sumImag=0;
        for (var inIndex=0; inIndex<nSamples; inIndex++)
        {
            var angle = -2 * Math.PI * inIndex * outIndex / nSamples;
            var cosA = Math.cos(angle);
            var sinA = Math.sin(angle);
            //sumReal += complexArray[inIndex].real*Math.cos(angle) + complexArray[inIndex].imag*Math.sin(angle);
            //sumImag += -complexArray[inIndex].real*Math.sin(angle) + complexArray[inIndex].imag*Math.cos(angle);

            sumReal += complexArray[inIndex].real*cosA / nSamples
                     + complexArray[inIndex].imag*sinA / nSamples;
        }
        result.push( new complex_t(sumReal, 0) );
    }
    return result;
}

function FFT(complexArray,isForwards) //double *x,double *y)
{
   var n,i,i1,j,k,i2,l,l1,l2;       // long
   var c1,c2,tx,ty,t1,t2,u1,u2,z;   // double

   var m = Math.log2( complexArray.length );
   if (Math.floor(m) != m)
    return false;

   // Calculate the number of points
   //n = 1;
   //for (i=0;i<m;i++) 
   //   n *= 2;
   n = complexArray.length;

   // Do the bit reversal
   i2 = n >> 1;
   j = 0;
   for (i=0; i<n-1; i++) 
   {
      if (i < j)
      {
        tx = complexArray[i].real;  //x[i];
        ty = complexArray[i].imag;  //y[i];
        complexArray[i].real = complexArray[j].real;    //x[i] = x[j];
        complexArray[i].imag = complexArray[j].imag;    //y[i] = y[j];
        complexArray[j].real = tx;  //x[j] = tx;
        complexArray[j].imag = ty;  //y[j] = ty;
      }
      k = i2;
      while (k <= j)
      {
         j -= k;
         k >>= 1;
      }
      j += k;
   }

   // Compute the FFT
   c1 = -1.0; 
   c2 = 0.0;
   l2 = 1;
   for (l=0; l<m; l++)
   {
      l1 = l2;
      l2 <<= 1;
      u1 = 1.0; 
      u2 = 0.0;
      for (j=0; j<l1; j++)
      {
         for (i=j; i<n; i+=l2)
         {
            i1 = i + l1;
            t1 = u1*complexArray[i1].real - u2*complexArray[i1].imag;   //t1 = u1 * x[i1] - u2 * y[i1];
            t2 = u1*complexArray[i1].imag + u2*complexArray[i1].real;   //t2 = u1 * y[i1] + u2 * x[i1];
            complexArray[i1].real = complexArray[i].real-t1;    //x[i1] = x[i] - t1; 
            complexArray[i1].imag = complexArray[i].imag-t2;    //y[i1] = y[i] - t2;
            complexArray[i].real += t1; //x[i] += t1;
            complexArray[i].imag += t2; //y[i] += t2;
         }
         z =  u1 * c1 - u2 * c2;
         u2 = u1 * c2 + u2 * c1;
         u1 = z;
      }
      c2 = Math.sqrt((1.0 - c1) / 2.0);
      if (isForwards == true) 
         c2 = -c2;
      c1 = Math.sqrt((1.0 + c1) / 2.0);
   }

   // Scaling for forward transform
   if (isForwards == true)
   {
      for (i=0; i<n; i++)
      {
         complexArray[i].real /= n; //x[i] /= n;
         complexArray[i].imag /= n; //y[i] /= n;
      }
   }
   return true;
}


/*
    BlackmanWindow

    alpha   = 0.16
        a0  = (1-alpha)/2
    a1      = 1 / 2
    a2      = alpha / 2
    func(n) = a0 - a1 * cos( 2*pi*n / N ) + a2 * cos(4*pi*n/N)
*/
function applyBlackmanWindow( floatSampleArray )
{
    let N = floatSampleArray.length;
    let alpha = 0.16;
    let a0 = (1-alpha)/2;
    let a1 = 1 / 2;
    let a2 = alpha / 2;
    var result = [];
    for (var n=0; n<N; n++)
        result.push( (a0 - (a1 * Math.cos( 2*Math.PI*n / N )) + (a2 * Math.cos(4*Math.PI*n/N)) ) * floatSampleArray[n]);
    return result;
}

// function(n) = n
//
function applyRectWindow( floatSampleArray )
{
    var result = [], N = floatSampleArray.length;
    for (var n=0; n<N; n++)
        result.push( floatSampleArray[n] );
    return result;
}

// function(n) = 1/2 (1 - cos((2*pi*n)/N))
//
function applyHanningWindow( floatSampleArray )
{
    var result = [], N=floatSampleArray.length, a2=1/2;
    for (var n=0; n<N; n++)
        result.push( a2 * (1 - Math.cos( (2*Math.PI*n)/N)) * floatSampleArray[n] );
    return result;
}

function convertToDb( floatArray )
{
    var result = floatArray.map( function(elem) { return 20 * Math.log10(elem); } );
    return result;
}

var lastFrameBins = [];

function getByteFreqData( floatSampleArray )
{
    var windowedData = applyBlackmanWindow(floatSampleArray.map(function(elem){return elem;}) );
//  var windowedData = applyRectWindow(floatSampleArray.map(function(elem){return elem;}) );
//  var windowedData = applyHanningWindow(floatSampleArray.map(function(elem){return elem;}) );

    var complexSamples = windowedData.map( function(elem) { return   new complex_t(elem,0); } );
    FFT(complexSamples, true);
    var timeConst = 0.80;

    var validSamples = complexSamples.slice(complexSamples.length/2);
    var validBins = validSamples.map( function(el){return Math.sqrt(el.real*el.real + el.imag*el.imag);} );
    if (lastFrameBins.length != validBins.length)
    {
        console.log('lastFrameBins refresh');
        lastFrameBins = [];
        validBins.forEach( function() {lastFrameBins.push(0);} );
    }

    var smoothedBins = [];
    smoothedBins = validBins.map( 
                                    function(el, index)
                                    {
                                        return timeConst * lastFrameBins[index] + (1-timeConst)*el;
                                    }
                                );
    lastFrameBins = smoothedBins.slice();


    var bins = convertToDb( smoothedBins );

    var minDB = -100;
    var maxDB =  -30;

    bins = bins.map( 
                        function(elem) 
                        { 
                            if (isNaN(elem)==true) 
                                elem = minDB;

                            else if (elem < minDB)
                                elem = minDB;

                            else if (elem > maxDB)
                                elem = maxDB;

                            return ((elem-minDB) / (maxDB-minDB) ) * 255;
                        }
                    );
    return bins;
}