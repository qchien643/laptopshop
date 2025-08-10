package com.example.spring_boot.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.spring_boot.domain.Target;
import com.example.spring_boot.repository.TargetRepository;

@Service
public class TargetService {

    private final TargetRepository targetRepository;

    public TargetService(TargetRepository targetRepository) {
        this.targetRepository = targetRepository;
    }

    public List<Target> getAllTargets() {
        return targetRepository.findAll();
    }

}
