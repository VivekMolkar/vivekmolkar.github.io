---
title: "Why I Built a Tool That Refuses to Auto-Post"
author: vivek
date: 2026-01-05 10:30:00 +05:30
categories: [Engineering, Writing]
tags: [tools, automation, developer-experience, system-thinking]
description: "A reflection on why publishing threads is a cognitive problem, and why not everything should be automated."
---

Writing thoughtful content is hard.

Not because typing is difficult —  
but because thinking clearly takes effort.

Publishing that content as a thread should be the easy part.  
And yet, it rarely is.


## The quiet friction nobody talks about

If you’ve ever published a long thread, you know the routine:

- split your writing into multiple posts  
- track which one is 1/n, 2/n, 3/n  
- copy, paste, post  
- reply to the correct previous post  
- repeat  
- hope you didn’t mess up the order  

None of this is *hard*.

It’s just… distracting.

By the time you’re halfway through, you’re no longer thinking about what you wrote —  
you’re thinking about mechanics.

That’s the real problem.


## Why most “solutions” feel wrong

When this friction shows up, the usual response is:

> “Let’s automate everything.”

Auto-posting tools.  
Schedulers.  
APIs.  
Bots.

They remove effort — but they also remove intention.

They blur the moment where you still want to:
- reread what you wrote
- decide if this really goes out
- slow down before hitting “post”

I didn’t want to lose that moment.


## The insight: keep the human, remove the friction

What I actually wanted was simpler:

- keep me in control  
- remove the boring parts  
- guide me, don’t replace me  

So instead of asking:

> “How do I auto-post threads?”

I asked:

> **“How do I make publishing feel calm and deliberate?”**

That question led to a very different kind of tool.


## Enter `threadsmith` (quietly)

`threadsmith` is a small CLI tool that helps you publish threads **one post at a time**.

You give it a file.  
Each block becomes a post.  
It validates basic constraints.  
Then it guides you:

- here’s the next post  
- copy it (if possible)  
- paste and publish  
- press ENTER when you’re ready to continue  

No scheduling.  
No APIs.  
No background automation.

Just a steady rhythm.


## What it deliberately does not do

This part matters.

`threadsmith` does **not**:

- auto-post  
- authenticate with platforms  
- optimize reach  
- generate content  
- chase engagement  

Those are different problems.

This tool exists to support **intentional publishing**, not growth hacking.


## A small workflow change, a big mental shift

The surprising part wasn’t the code.

It was how much mental space it freed up.

Once order, pacing, and validation were handled,  
I could focus on the words again —  
even halfway through a long thread.

That’s the win.


## Automation, used carefully

I’ve started to believe this:

> **Automation should remove friction, not responsibility.**

When tools respect that boundary,  
they don’t take control away —  
they give clarity back.

That’s what `threadsmith` is trying to do.

Quietly.
