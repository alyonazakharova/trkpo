package main.service;

import main.entity.Instrument;
import main.exception.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import main.repository.InstrumentRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class InstrumentServiceImpl implements InstrumentService {
    @Autowired
    private InstrumentRepository instrumentRepository;

    @Override
    public void add(Instrument customer) {
        instrumentRepository.save(customer);
    }

    @Override
    public void delete(long id) {
        Optional<Instrument> instrument = instrumentRepository.findById(id);
        if (!instrument.isPresent()) {
            throw new EntityNotFoundException("Instrument not found");
        }
        instrumentRepository.delete(instrument.get());
    }

    @Override
    public Instrument getById(long id) {
        Optional<Instrument> instrument = instrumentRepository.findById(id);
        if (!instrument.isPresent()) {
            throw new EntityNotFoundException("Instrument not found");
        }
        return instrument.get();
    }

    @Override
    public boolean checkById(long id) {
        return instrumentRepository.findById(id).isPresent();
    }
}
