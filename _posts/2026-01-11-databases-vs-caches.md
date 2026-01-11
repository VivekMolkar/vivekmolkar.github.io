---
title: "Databases vs Caches (Why Some Systems Decide — and Others Just Remember)"
author: vivek
image:
  path: /assets/img/databases-vs-caches/databases-vs-caches-p.png
date: 2026-01-11 16:00:00 +05:30
categories: [System Design]
tags: [system-design, fundamentals, data]
description: "A first-principles explanation of databases vs caches, clarifying sources of truth, memory, and why confusing the two leads to fragile systems."
mermaid: false
pin: false
---


## When Fast Starts Feeling Fragile

Your system is fast.

Pages load instantly.  
APIs respond in milliseconds.

Then something strange happens.

Data disappears.  
Values reset.  
Information looks… unreliable.

Nothing crashed.

But something important was misunderstood.

You treated memory as truth.


## The Core Distinction (No Jargon)

At a high level:

> **Databases decide.  
> Caches remember.**

They serve different purposes.

Confusing them leads to systems that feel fast —  
until they don’t feel *correct*.


## What a Database Is Really For

A database exists to be the **source of truth**.

It is responsible for:
- durability (data survives crashes)
- correctness (rules are enforced)
- consistency (within defined guarantees)

When a decision must be final —  
the database decides.

Everything else is optional.


## What a Cache Is Really For

A cache exists to **avoid work**.

It is responsible for:
- speed
- reducing load
- absorbing bursts

Caches:
- can be cleared
- can be wrong temporarily
- can disappear without warning

They are helpful —  
but not authoritative.


## A Simple Story: Notes vs Memory

Imagine solving a problem.

You:
- write the final answer in a notebook
- keep intermediate steps in your head

Your memory is fast.  
Your notebook is reliable.

If you forget something, you recompute.  
If the notebook is wrong, everything breaks.

Caches are memory.  
Databases are notebooks.


## Why Mixing Roles Breaks Systems

Problems start when:
- caches are treated as durable
- databases are treated as performance layers

This leads to:
- lost updates
- subtle corruption
- bugs that vanish on restart

Fast systems become fragile systems.


## ⚠️ Common Trap

**Trap:** Using a cache as a database.

Examples:
- storing critical state only in Redis
- assuming cached values will always exist
- skipping persistence because “it’s fast”

Caches forget.  
Databases don’t.

Design accordingly.

## How This Connects to What We’ve Learned

- **Caching**  
  Speeds up access, never defines truth.  
  https://vivekmolkar.com/posts/caching/

- **Cache Invalidation**  
  Exists because caches can be wrong.  
  [https://vivekmolkar.com/posts/cache-invalidation/](https://vivekmolkar.com/posts/cache-invalidation/)

- **Consistency Models**  
  Describe how truth spreads over time.  
  [https://vivekmolkar.com/posts/consistency-models/](https://vivekmolkar.com/posts/consistency-models/)

- **CDN**  
  Pushes remembered data closer to users.  
  [https://vivekmolkar.com/posts/cdn/](https://vivekmolkar.com/posts/cdn/)

Databases anchor everything.


> 
**Databases decide.  
Caches remember.**
{: .prompt-tip }

## 🧪 Mini Exercise

Look at a piece of data in your system.

1. Where is it *decided*?
2. Where is it *cached*?
3. What happens if the cache is wiped?

If the answer to #3 scares you,  
you’ve blurred the boundary.


## What Comes Next

Once you know where truth lives…

> **How do systems scale reads and writes differently?**

Next: **Read-Heavy vs Write-Heavy Systems**  
Why optimizing one often hurts the other.
