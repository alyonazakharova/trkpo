package main;

import main.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import main.repository.*;

import java.sql.Date;

@Component
public class TestDataInit implements CommandLineRunner {
    @Autowired
    CustomerRepository customerRepository;

    @Autowired
    InstrumentRepository instrumentRepository;

    @Autowired
    ReservationRepository reservationRepository;

    @Autowired
    RoomInstrumentRepository roomInstrumentRepository;

    @Autowired
    RoomRepository roomRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder pwdEncoder;

    @Override
    public void run(String[] args) throws Exception {
        Instrument instrument = new Instrument("instrument_name", "description");
        Room room = new Room("room_name", "description", 100L);

        roomRepository.save(room);
        instrumentRepository.save(instrument);
        roomInstrumentRepository.save(new RoomInstrument(room, instrument));

        User user = new User("admin", pwdEncoder.encode("password"), "ADMIN");
        userRepository.save(user);

        Customer customer = new Customer("name", "+79643423523", user);
        customerRepository.save(customer);

        Reservation reservation = new Reservation(Date.valueOf("2021-12-16"), room, customer);
        reservationRepository.save(reservation);
    }
}
