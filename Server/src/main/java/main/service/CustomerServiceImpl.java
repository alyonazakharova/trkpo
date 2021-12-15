package main.service;

import main.entity.Customer;
import main.exception.EntityNotFoundException;
import main.model.CustomerModel;
import org.springframework.beans.factory.annotation.Autowired;
import main.repository.CustomerRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CustomerServiceImpl implements CustomerService{
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void add(Customer customer) {
        customerRepository.save(customer);
    }

    @Override
    public void delete(long id) {
        Optional<Customer> customer = customerRepository.findById(id);
        if (!customer.isPresent()) {
            throw new EntityNotFoundException("Customer not found");
        }
        customerRepository.delete(customer.get());
    }

    @Override
    public void update(long id, CustomerModel customer) {
        Optional<Customer> customerOptional = customerRepository.findById(id);
        if (!customerOptional.isPresent()) {
            throw new EntityNotFoundException("Customer not found");
        }
        Customer customerOld = customerOptional.get();
        customerOld.setName(customer.getName());
        customerOld.setPhone(customer.getPhone());
        customerRepository.save(customerOld);
    }

    @Override
    public Customer getById(long id) {
        Optional<Customer> customer = customerRepository.findById(id);
        if (!customer.isPresent()) {
            throw new EntityNotFoundException("Customer not found");
        }
        return customer.get();
    }
}
