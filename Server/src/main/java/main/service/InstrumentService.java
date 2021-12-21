package main.service;

import main.entity.Instrument;

public interface InstrumentService {
    void add(Instrument customer);

    void delete(long id);

    Instrument getById(long id);

    boolean checkById(long id);
}
