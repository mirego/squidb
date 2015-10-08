/*
 * Copyright 2015, Yahoo Inc.
 * Copyrights licensed under the Apache 2.0 License.
 * See the accompanying LICENSE file for terms.
 */
package com.yahoo.squidb.data.android;

import android.content.ContentValues;
import android.os.Parcel;
import android.os.Parcelable;

import java.lang.reflect.Array;

public final class ModelCreator<TYPE extends ParcelableModel>
        implements Parcelable.Creator<TYPE> {

    private final Class<TYPE> cls;

    public ModelCreator(Class<TYPE> cls) {
        super();
        this.cls = cls;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    public TYPE createFromParcel(Parcel source) {
        TYPE model;
        try {
            model = cls.newInstance();
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
        ContentValues setValues = source.readParcelable(ContentValues.class.getClassLoader());
        ContentValues values = source.readParcelable(ContentValues.class.getClassLoader());
        model.initWithContentValues(setValues, values);
        return model;
    }

    /**
     * {@inheritDoc}
     */
    @Override
    @SuppressWarnings("unchecked")
    public TYPE[] newArray(int size) {
        return (TYPE[]) Array.newInstance(cls, size);
    }
}
