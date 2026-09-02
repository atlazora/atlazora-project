# Atlazora Product Vision

## Purpose

Atlazora is a marketplace platform that connects buyers and suppliers through structured commercial workflows.

The platform must support the complete business lifecycle progressively, including supplier participation, catalog and offers, discovery, RFQ and quotations, orders and samples, payments and financial protection, logistics, inspection, disputes, reputation, and monetization.

## Product Principle

The product must be designed as a durable marketplace platform rather than as a direct rewrite of the legacy Laravel implementation.

The legacy system is a migration/reference source, not the architectural target.

## Primary Product Surfaces

- Marketplace web experience for buyers and suppliers.
- Administrative and operational experience for Atlazora staff.
- Transactional platform core.
- Intelligence and data capabilities.
- Versioned shared contracts.
- Managed infrastructure and deployment platform.

## Core Modeling Principles

The approved planning baseline includes these distinctions:

- Product is not the same concept as Offer.
- User is not the same concept as Organization.
- Transactional business truth must have explicit ownership.
- Derived search/index data must not become authoritative transactional truth.

## V1 Foundation Principle

Any foundation required for V1 to be correct, secure, operable, scalable, and to avoid painful rebuilds must exist from the beginning.

Advanced complexity may be deferred.

Foundational correctness may not.

## Planning Status

The detailed Product Vision & Business Model decisions from Phase 01 are approved planning inputs.

W00-WU01 must preserve those decisions in Git documentation before completion.

This document currently records the confirmed cross-phase product baseline. Detailed business-model language from the approved planning material remains to be formally imported where it is not already represented by the governance and ADR set.
