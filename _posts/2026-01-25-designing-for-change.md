---
title: "Designing for Change (Why Systems Fail Months Later)"
author: vivek
date: 2026-01-25 16:00:00 +05:30
categories: [System Design]
tags: [system-design, architecture, evolution]
description: "Why systems rarely fail on day one, and how designing for change is about surviving evolving requirements, not predicting them."
mermaid: true
pin: false
image:
  path: /assets/img/designing-for-change/designing-for-change-p.jpg
---

## Most Systems Don’t Fail When They’re Built

They fail later.

- Not on day one.
- Not during launch.
- Not when traffic spikes.

They fail when something _changes_.

- A new requirement.
- A new customer.
- A new workflow that “should be simple”.

That’s when cracks appear.

## The First Time This Pattern Hit Me

The system worked perfectly.

It did exactly what it was designed to do.

Then someone asked:

> “Can we support one more case?”

It sounded harmless.  
A small tweak.  
A conditional.

But that one change triggered:

- new branches everywhere
- duplicated logic
- fragile assumptions breaking silently

Nothing was wrong with the system.

It was just **not designed to change**.

## The Mistake We Usually Make

We design systems to solve _today’s problem_.

That’s natural.  
That’s human.

But systems don’t live in “today”.  
They live in **evolution**.

The real question isn’t:

> “Does this work now?”

It’s:

> “What will break when this changes?”

## The Analogy That Made This Clear

Think of a **tightrope bridge**.

It works perfectly for one person walking straight across.

But the moment:

- two people walk together
- someone stops midway
- someone turns around

The bridge starts wobbling.

The bridge wasn’t wrong.  
It just wasn’t designed for movement beyond the original assumption.

That’s what change does to systems.

## What “Designing for Change” Really Means

It doesn’t mean:

- predicting every future requirement
- over-engineering
- building abstractions “just in case”

It means designing **clear seams**.

Places where:

- behavior can change
- rules can evolve
- decisions can be replaced

Without tearing everything apart.

## Where Change Usually Hurts First

From experience, these are common pain points:

- Business rules mixed with infrastructure logic
- APIs exposing internal assumptions
- Data models tied tightly to workflows
- “Temporary” shortcuts becoming permanent

Change doesn’t break systems.  
Coupling does.

## A Quiet Smell I Watch For

When adding a new feature requires:

- touching many unrelated files
- understanding the whole system
- coordinating multiple teams

That’s a signal.

The system isn’t brittle —  
it’s **rigid**.

## How This Connects to the Series

- **Synchronous vs Asynchronous Systems**  
  [https://vivekmolkar.com/posts/synchronous-vs-asynchronous-systems/](https://vivekmolkar.com/posts/synchronous-vs-asynchronous-systems/)

- **Event-Driven Architecture**  
  [https://vivekmolkar.com/posts/event-driven-architecture-when-time-matters/](https://vivekmolkar.com/posts/event-driven-architecture-when-time-matters/)

- **API Design (Contracts Over Code)**  
  [https://vivekmolkar.com/posts/api-design-contracts-over-code/](https://vivekmolkar.com/posts/api-design-contracts-over-code/)

- **Observability**  
  [https://vivekmolkar.com/posts/observability/](https://vivekmolkar.com/posts/observability/)

These ideas all answer the same question:
_How much damage does change cause?_

> 
**Good systems don’t predict change. They survive it.**
{: .prompt-tip}

Designing for change is about resilience,  
not foresight.

## What Comes Next

Once we understand change…

> **How do all these ideas come together in a real system?**

Next: **A System Design Walkthrough (Putting It All Together)**
