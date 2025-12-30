---
title: "Latency vs Throughput (Why Fast Systems Still Feel Slow)"
image:
  path: /assets/img/latency-vs-throughput/latency-vs-throughput-p.png
author: vivek
date: 2025-12-30 10:00:00 +05:30
categories: [System Design]
tags: [system-design, performance, fundamentals]
description: "A first-principles explanation of latency and throughput using simple analogies and diagrams."
mermaid: true
pin: false
---

## Why This Confusion Matters

You open an app.

The backend team says:
> “Our system is very fast.”

Yet the screen keeps loading. Spinners spin. Users complain. So what’s going on?

This confusion usually comes from mixing up **latency** and **throughput**.


## The Real Problem Behind “Speed”

When we say a system is *fast*, we often mean different things.

Sometimes we mean:
- *How long does one request take?*

Other times we mean:
- *How many requests can we handle at once?*

These are **not the same thing**.


## A Simple Story: The Highway

Imagine a highway.

- Latency is **how long one car takes** to reach its destination.
- Throughput is **how many cars pass per minute**.

You can have:
- a wide highway (high throughput)
- but still slow traffic (high latency)

Same with software.


## The Two Concepts (Names Matter)

### Latency

**Latency** is the time taken for **one request** to complete.

> “I clicked a button — how long did I wait?”

---

### Throughput

**Throughput** is how much work a system can handle **over time**.

> “How many requests per second can we process?”


## Seeing This Visually

### High Throughput, High Latency

```mermaid
flowchart LR
    Users -->|Many requests| Server
    Server -->|Slow response| Users
```

The system handles **many users**,  
but **each user waits longer**.


### Low Throughput, Low Latency

```mermaid
flowchart LR
    User -->|Few requests| Server
    Server -->|Fast response| User
```

Fast for one user,  
but collapses under load.


## Where Systems Break

Most real-world systems fail because:
- latency increases under load
- queues build up
- users *feel* slowness even if throughput is high

This is why:
- “It works on my machine”
- doesn’t mean
- “It works in production”


## A Real Example You’ve Experienced

Think of **IRCTC ticket booking**.

- Thousands of requests per second (high throughput)
- But each click feels slow (high latency)

The system is busy — not broken.

>
**Latency = time per request**  
**Throughput = work per second**   
A system can be good at one and bad at the other.
{: .prompt-tip }

## What’s Coming Next

Tomorrow we answer another common mix-up:

**Scalability vs Performance**  
Why making things faster is not the same as making them scalable.
