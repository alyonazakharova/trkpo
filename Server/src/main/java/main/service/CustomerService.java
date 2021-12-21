package main.service;

import main.entity.Customer;
import main.model.CustomerModel;

public interface CustomerService {
    void add(Customer customer);

    void delete(long id);

    void update(long id, CustomerModel customer);

    Customer getById(long id);

    Customer getByUserId(long id);
}
