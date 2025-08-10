package com.example.spring_boot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.spring_boot.domain.Factory;

@Repository
public interface FactoryRepository extends JpaRepository<Factory, Long> {

}
