---
title: "Consistency Models (Why Different Users See Different Truths - and Why That’s Sometimes Okay)"
author: vivek
image:
  path: /assets/img/consistency-models/consistency-models-p.png
date: 2026-01-09 16:00:00 +05:30
categories: [System Design]
tags: [system-design, fundamentals, distributed-systems]
description: "A first-principles explanation of consistency models, focusing on agreement over time, real-world trade-offs, and why eventual consistency is often intentional."
mermaid: false
pin: false
---


## When Two People See Two Different Things

You refresh a page.

Your teammate refreshes the same page.

You see the updated value.  
They still see the old one.

No error message.  
No crash.  
No spike on the dashboard.

Just… disagreement.

At first glance, this feels like a bug.

Often, it isn’t.

It’s a **consistency decision** playing out.


## The Question Every Distributed System Faces

As systems grow, they run into a fundamental tension:

> **Do we want everyone to see the same data at the same moment,  
or do we want the system to stay fast and available?**

Waiting helps agreement.  
Not waiting helps speed.

You rarely get both.

Consistency models exist to describe **which side you choose**.


## A Simple Story: Friends and the Same News

A breaking event happens.

One friend hears about it immediately.  
Another hears about it minutes later.

For a short while:
- both believe different versions of reality
- neither is “wrong”

Eventually, everyone agrees on the same facts.

The world didn’t break.  
It just **converged over time**.

Distributed systems behave the same way.


## What “Consistency” Means (Without Definitions)

Consistency is about **agreement over time**.

When data changes, consistency answers:
- who sees the change first?
- who sees it later?
- how long disagreement is allowed?

Some systems aim for:
- **strong consistency**  
  Everyone sees the same value before moving on.

Others accept:
- **eventual consistency**  
  Everyone agrees, but not immediately.

Neither approach is universally correct.  
Each trades something away.


## Why Perfect Agreement Is Expensive

To keep everyone in sync:
- systems must coordinate
- updates must wait for confirmation
- slow paths slow everything

As systems span:
- machines
- networks
- regions

Waiting becomes costly.

So many systems choose:

> *Be fast and available now -  
agree fully a little later.*

That choice is not accidental.  
It’s design.


## How This Connects to Caching and Invalidation

Caching creates memory.

Invalidation tries to erase it.

Consistency explains **why full erasure is unrealistic**.

Different layers forget at different times.

So for a while:
- some users see new data
- others see old data

That window of disagreement isn’t always a bug.  
It’s the cost of scale.


## ⚠️ Common Trap

**Trap:** Treating eventual consistency as a failure.

Eventual consistency is not “bad consistency”.  
It’s a conscious decision to favor:
- performance
- availability
- resilience

The real mistake is using it  
without understanding where disagreement hurts.


## A Situation You’ve Probably Seen

Have you noticed:
- a deleted post still visible briefly?
- permissions taking time to apply?
- prices differing across devices for a moment?

That’s consistency in action.

Not negligence.  
Not incompetence.

Design trade-offs becoming visible.


>
**Consistency isn’t about instant truth.  
It’s about when systems agree.**
{: .prompt-tip }

## 🧪 Mini Exercise

Think about a system you know.

1. What data must be correct **immediately**?
2. What data can tolerate being stale for a few seconds?
3. What breaks if users disagree temporarily?

Your answers define the system’s consistency model -  
even if no one ever named it.


## What Comes Next

If systems can disagree for a while…

> **What happens when data is served from locations far away from the source?**

Next: **CDN**  
How caching goes global - and why geography changes everything.

