package com.eaprego.prohill.util;

import org.apache.tomcat.util.codec.binary.Base64;

public class Base64Util {

    public static final String decode(final String data) {
        byte[] byteArray = Base64.decodeBase64(data.getBytes());
        return new String(byteArray);
    }

    public static final byte[] decodeBytes(final String data) {
        return Base64.decodeBase64(data.getBytes());
    }

    public static String encode(final String data) {
        return Base64.encodeBase64String(data.getBytes());
    }
}
