---
title: "Cache Invalidation (Why Making Things Fast Is Easy — Keeping It Correct Is Hard)"
author: vivek
image: 
  path: /assets/img/cache-invalidation/cache-invalidation-p.png
date: 2026-01-08 16:00:00 +05:30
categories: [System Design]
tags: [system-design, fundamentals, caching]
description: "A first-principles explanation of cache invalidation, why it is hard, and how correctness quietly breaks in fast systems."
mermaid: true
pin: false
---


## When a Fast System Starts Lying

Everything looks healthy.

- responses are instant  
- servers are idle  
- dashboards are green  

Then someone reports:

> “I updated my data… but I still see the old value.”

Nothing crashed.  
Nothing timed out.

But the system is now **wrong**.

That moment is cache invalidation.


## The Real Question Caching Introduces

Caching remembers answers.

Systems, however, change.

So the real system design question is not:

> “Can we cache this?”

It’s:

> **“When should the system forget?”**

That single question is why cache invalidation is hard.


## A Simple Story: Updating a Notice Board

Imagine an office notice board.

A message is posted.  
People read it.  
Some remember it.

Later, the message is updated.

Unless everyone who remembered the old message is told to forget it,  
different people will act on different truths.

That’s cache invalidation.

Not changing the source —  
changing *every memory of it*.


## Why Invalidation Is Fundamentally Difficult

Because cached data:

- exists in multiple places  
- lives at different layers  
- expires at different times  

You’re not invalidating one cache.

You’re invalidating:
- browser caches  
- CDN caches  
- reverse proxy caches  
- application-level caches  
- database-level caches  

And they don’t coordinate.

They just remember.


## How Systems Usually Try to Forget

In practice, systems rely on a small set of strategies:

### Time-based (TTL)
“Forget this after N seconds.”

Simple.  
Predictable.  
Often wrong for a while.


### Event-based
“Forget this when data changes.”

More correct.  
Much harder.  
Easy to miss edge cases.


### Manual busting
“Force forget now.”

Powerful.  
Risky.  
Often used during incidents.

None of these are perfect.  
Each trades correctness for simplicity or safety.


## ⚠️ Common Trap

**Trap:** Believing TTL solves invalidation.

TTL doesn’t make data correct.  
It only limits **how long it can be wrong**.

Short TTLs:
- reduce staleness  
- increase load  

Long TTLs:
- improve performance  
- risk incorrect behavior  

TTL is a compromise — not a solution.


## A Failure Pattern You’ve Likely Seen

Many production issues are not outages.

They’re things like:
- old prices displayed  
- revoked access still allowed  
- deleted content still visible  

The system responds fast.  
But it responds with **the past**.

These bugs are dangerous because:
- monitoring often stays green  
- users lose trust quietly  


## How This Connects to What We’ve Built So Far

- **Caching**  
  Invalidation exists only because caching exists.  
  [https://vivekmolkar.com/posts/caching/](https://vivekmolkar.com/posts/caching/)

- **Stateless vs Stateful**  
  Hidden state in caches makes correctness harder.
  [https://vivekmolkar.com/posts/stateless-vs-stateful/](https://vivekmolkar.com/posts/stateless-vs-stateful/)

This is where performance optimizations collide with correctness.


>
**Caching makes systems fast.  
Invalidation decides whether they’re right.**
{: .prompt-tip }

## 🧪 Mini Exercise

Think about a cached response in your system.

1. What event should invalidate it?
2. How many layers remember this data?
3. What happens if it stays wrong for 5 minutes?

If you can’t answer all three,  
your cache is already a future bug.


## What Comes Next

Cache invalidation reveals a deeper truth:

> **Different parts of a system don’t agree on reality at the same time.**

Next: **Consistency Models**  
Why “eventually correct” exists — and when it’s acceptable.

