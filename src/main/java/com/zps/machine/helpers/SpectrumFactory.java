package com.zps.machine.helpers;

import com.zps.machine.helpers.ArrayUtils;
import com.zps.machine.helpers.wavIO;

public class SpectrumFactory {
 // Vzito z: https://cnx.org/contents/1KmznyM9@3/Java1485-Spectrum-Analysis-using-Java-Forward-and-Inverse-Transforms-Filtering-in-the-Frequency-Domain
  public static Spectrum<?> getSpectrum(short[] wave) {
    wave = handleNonPowerOf2(wave);
    return new Spectrum<Short>(ArrayUtils.toObject(wave));
  }

  public static Spectrum<?> getSpectrum(double[] wave) {
    wave = handleNonPowerOf2(wave);
    return new Spectrum<Double>(ArrayUtils.toObject(wave));
  }

  public static Spectrum<?> getSpectrum(String wavFilePath) {
    wavIO wav = new wavIO(wavFilePath);
    wav.read();
    byte[] wavData = wav.myData;
    short[] shortData = ArrayUtils.byte2Short(wavData);
    shortData = handleNonPowerOf2(shortData);
    return new Spectrum<Short>(ArrayUtils.toObject(shortData));
  }
  
  private static short[] handleNonPowerOf2(short[] arr) {
    int length = arr.length;
    int i = 0;
    while (true) {
      if (Math.pow(2, i) == length || Math.pow(2, i + 1) == length) {
        return arr;
      }
      else if (Math.pow(2, i) < length && Math.pow(2, i + 1) > length) {
        int padding = (int) (Math.pow(2, i + 1) - length);
        short[] paddingArray = new short[padding];
        arr = ArrayUtils.concat(arr, paddingArray);
        return arr;
      }
      i++;
    }
  }
  
  private static double[] handleNonPowerOf2(double[] arr) {
    int length = arr.length;
    int i = 0;
    while (true) {
      if (Math.pow(2, i) == length || Math.pow(2, i + 1) == length) {
        return arr;
      }
      else if (Math.pow(2, i) < length && Math.pow(2, i + 1) > length) {
        int padding = (int) (Math.pow(2, i + 1) - length);
        double[] paddingArray = new double[padding];
        arr = ArrayUtils.concat(arr, paddingArray);
        return arr;
      }
      i++;
    }
  }

}
