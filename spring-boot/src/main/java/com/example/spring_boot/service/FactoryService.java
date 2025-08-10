package com.example.spring_boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring_boot.domain.Factory;
import com.example.spring_boot.repository.FactoryRepository;

@Service
public class FactoryService {

    private final FactoryRepository factoryRepository;

    public FactoryService(FactoryRepository factoryRepository) {
        this.factoryRepository = factoryRepository;
    }

    public List<Factory> getAllFactories() {
        return factoryRepository.findAll();
    }

}
