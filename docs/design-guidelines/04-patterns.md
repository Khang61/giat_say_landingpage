# UI Patterns - The Clean Lab

**Version:** 1.0.0
**System:** "Titanium Command" Pattern Library

---

## Pattern Overview

UI patterns are reusable solutions for common user flows. Each pattern combines multiple components into cohesive experiences.

**Pattern Types:**
1. **Payment Flow** - End-to-end payment experience
2. **Machine Selection** - Equipment browsing and selection
3. **Service Selection** - Wash/dry program choosing
4. **Status Display** - Real-time equipment status
5. **Success/Error States** - Feedback screens

---

## Payment Flow Pattern

**Context:** Kiosk payment processing for laundry services
**Platforms:** Kiosk (primary), Web (secondary)

### Flow Overview

```
[Service Selection]
       ↓
[Machine Selection]
       ↓
[Program Selection]
       ↓
[Payment Method] ──→ [QR Code] ──→ [Scan & Pay] ──→ [Success]
       ↓
    [Card] ──→ [Insert Card] ──→ [Processing] ──→ [Success]
       ↓
    [Cash] ──→ [Insert Bills] ──→ [Counting] ──→ [Success]
```

### Screen 1: Payment Method Selection

**Layout:**
- 3-column grid (QR, Card, Cash)
- Large touch targets (82px minimum)
- Price summary sidebar
- Clear icons + labels

**Components:**
- `card-grid-3`
- `card card-selectable card-kiosk`
- `btn btn-kiosk`

**Example:**

```html
<div class="payment-method-screen">
  <header class="header">
    <button class="btn btn-ghost btn-icon">← Back</button>
    <h2>Select Payment Method</h2>
  </header>

  <main class="payment-method-content">
    <div class="card-grid-3">
      <!-- QR Code Payment -->
      <div class="card card-selectable card-kiosk" role="button">
        <div class="payment-icon">
          <svg class="icon icon-xl"><!-- QR icon --></svg>
        </div>
        <h3>QR CODE</h3>
        <p>Scan with banking app</p>
        <span class="status status-success">Fast & Easy</span>
      </div>

      <!-- Card Payment -->
      <div class="card card-selectable card-kiosk" role="button">
        <div class="payment-icon">
          <svg class="icon icon-xl"><!-- Card icon --></svg>
        </div>
        <h3>CREDIT CARD</h3>
        <p>Insert card below</p>
      </div>

      <!-- Cash Payment -->
      <div class="card card-selectable card-kiosk" role="button">
        <div class="payment-icon">
          <svg class="icon icon-xl"><!-- Cash icon --></svg>
        </div>
        <h3>CASH</h3>
        <p>Bills accepted</p>
      </div>
    </div>

    <!-- Price Summary -->
    <aside class="payment-summary">
      <div class="card">
        <h3>Summary</h3>
        <div class="summary-row">
          <span>Machine 03</span>
          <span>-</span>
        </div>
        <div class="summary-row">
          <span>Standard Wash</span>
          <span class="tech-price">20.000₫</span>
        </div>
        <hr>
        <div class="summary-total">
          <strong>TOTAL</strong>
          <strong class="tech-price-lg">20.000₫</strong>
        </div>
      </div>
    </aside>
  </main>
</div>
```

**Design Rules:**
- Icon 48px minimum
- Label uppercase, bold
- Description secondary text
- Active state clearly visible

### Screen 2a: QR Code Payment

**Layout:**
- Full-screen focus on QR code
- Large QR code (300px×300px kiosk, 200px web)
- Step-by-step instructions
- Timer countdown
- Cancel button accessible

**Components:**
- QR code display (chamfered container)
- Step list (numbered)
- Timer badge
- Cancel button (ghost)

**Example:**

```html
<div class="payment-qr-screen">
  <div class="payment-focus-card">
    <h2>Scan QR Code to Pay</h2>

    <!-- QR Code Display -->
    <div class="qr-container chamfer-lg">
      <img src="qr-code.png" alt="Payment QR Code">
    </div>

    <div class="qr-amount">
      <span class="tech-price-lg">20.000₫</span>
    </div>

    <!-- Instructions -->
    <ol class="payment-steps">
      <li>Open your banking app</li>
      <li>Scan this QR code</li>
      <li>Confirm payment amount</li>
      <li>Complete transaction</li>
    </ol>

    <!-- Timer -->
    <div class="payment-timer">
      <svg class="icon"><!-- Timer icon --></svg>
      <span>Expires in <strong>4:58</strong></span>
    </div>

    <!-- Actions -->
    <div class="payment-actions">
      <button class="btn btn-ghost btn-lg">Cancel Payment</button>
    </div>
  </div>
</div>
```

**Design Rules:**
- QR code chamfered (not rounded)
- High contrast for scanability
- Clear timer visibility
- Cancel always accessible

### Screen 2b: Card Payment Processing

**Layout:**
- Device instruction prominent
- Progress indicator
- Clear status messaging
- Cancel option during insert phase

**Example:**

```html
<div class="payment-processing-screen">
  <div class="payment-focus-card">
    <div class="device-indicator device-card">
      <svg class="icon icon-xl"><!-- Card reader icon --></svg>
      <div class="device-animation">
        <!-- Animated card insertion -->
      </div>
    </div>

    <h2>Insert Your Card</h2>
    <p>Chip facing up, stripe facing down</p>

    <!-- Progress -->
    <div class="progress-bar">
      <div class="progress-bar-fill" style="width: 40%;"></div>
    </div>

    <div class="payment-status">
      <span class="status-dot status-dot-warning"></span>
      <span>Waiting for card...</span>
    </div>

    <button class="btn btn-ghost btn-lg">Cancel</button>
  </div>
</div>
```

**Processing State:**
```html
<div class="payment-processing-screen">
  <div class="payment-focus-card">
    <div class="spinner spinner-lg"></div>
    <h2>Processing Payment</h2>
    <p>Do not remove your card</p>

    <div class="progress-bar">
      <div class="progress-bar-fill" style="width: 75%;"></div>
    </div>

    <div class="payment-status">
      <span class="status-dot status-dot-warning"></span>
      <span>Contacting bank...</span>
    </div>
  </div>
</div>
```

### Screen 2c: Cash Payment

**Layout:**
- Bill acceptor indicator
- Running total display
- Accepted denominations
- Change calculation

**Example:**

```html
<div class="payment-cash-screen">
  <div class="payment-focus-card">
    <div class="device-indicator device-bill">
      <svg class="icon icon-xl"><!-- Bill acceptor icon --></svg>
    </div>

    <h2>Insert Bills</h2>

    <!-- Amount Display -->
    <div class="cash-display">
      <div class="cash-row">
        <span>Amount Due:</span>
        <span class="tech-price-lg">20.000₫</span>
      </div>
      <div class="cash-row cash-inserted">
        <span>Inserted:</span>
        <span class="tech-price-lg" style="color: var(--accent-primary);">15.000₫</span>
      </div>
      <div class="cash-row cash-remaining">
        <span>Remaining:</span>
        <span class="tech-price-lg" style="color: var(--status-error);">5.000₫</span>
      </div>
    </div>

    <!-- Accepted Bills -->
    <div class="cash-denominations">
      <span class="status status-success">10K</span>
      <span class="status status-success">20K</span>
      <span class="status status-success">50K</span>
      <span class="status status-success">100K</span>
    </div>

    <button class="btn btn-ghost btn-lg">Cancel & Refund</button>
  </div>
</div>
```

### Screen 3: Payment Success

**Layout:**
- Large success icon
- Confirmation message
- Next steps instruction
- Receipt option
- Auto-return timer

**Example:**

```html
<div class="payment-success-screen">
  <div class="payment-result-card">
    <!-- Success Icon -->
    <div class="result-icon result-icon-success">
      <svg class="icon icon-xl"><!-- Check icon --></svg>
    </div>

    <h1>Payment Successful</h1>
    <p>Your laundry will begin in 30 seconds</p>

    <!-- Details -->
    <div class="card card-sm">
      <div class="success-details">
        <div class="detail-row">
          <span>Machine:</span>
          <strong>03</strong>
        </div>
        <div class="detail-row">
          <span>Program:</span>
          <strong>Standard Wash</strong>
        </div>
        <div class="detail-row">
          <span>Amount Paid:</span>
          <strong class="tech-price">20.000₫</strong>
        </div>
        <div class="detail-row">
          <span>Duration:</span>
          <strong>45 minutes</strong>
        </div>
      </div>
    </div>

    <!-- Actions -->
    <button class="btn btn-primary btn-lg">Print Receipt</button>
    <button class="btn btn-ghost">View Machine Status</button>

    <!-- Auto-return timer -->
    <div class="auto-return">
      <span>Returning to home in <strong>10</strong> seconds...</span>
    </div>
  </div>
</div>
```

### Screen 4: Payment Error

**Example:**

```html
<div class="payment-error-screen">
  <div class="payment-result-card">
    <!-- Error Icon -->
    <div class="result-icon result-icon-error">
      <svg class="icon icon-xl"><!-- X icon --></svg>
    </div>

    <h1>Payment Failed</h1>
    <p>Your card was declined</p>

    <!-- Error Details -->
    <div class="card card-accent-error">
      <strong>Error Code: 402</strong>
      <p>Insufficient funds or card blocked</p>
    </div>

    <!-- Actions -->
    <button class="btn btn-primary btn-lg">Try Different Payment</button>
    <button class="btn btn-secondary btn-lg">Contact Support</button>
    <button class="btn btn-ghost">Cancel & Return</button>
  </div>
</div>
```

### Payment Flow Design Rules

#### ✅ DO
- Show clear progress indicators
- Provide device-specific instructions
- Display running totals prominently
- Include cancel option during wait states
- Auto-return after success/error (10-15s)
- Use service color coding (blue wash, orange dry)

#### ❌ DON'T
- Hide price summary during flow
- Disable cancel during processing
- Use vague error messages
- Skip receipt option
- Rely on color alone for status

---

## Machine Selection Pattern

**Context:** Browsing and selecting available laundry equipment
**Platforms:** Kiosk, Web, Mobile

### Layout

**Grid Display:**
- Responsive grid (2-4 columns)
- Large machine cards (82px touch target)
- Real-time status indicators
- Filter by service type

**Example:**

```html
<div class="machine-selection-screen">
  <header class="header">
    <h2>Select Machine</h2>
    <div class="filter-tabs">
      <button class="btn btn-wash">Wash (12)</button>
      <button class="btn btn-dry">Dry (8)</button>
      <button class="btn btn-ghost">All (20)</button>
    </div>
  </header>

  <div class="card-grid card-grid-3">
    <!-- Available Machine -->
    <div class="card card-selectable card-accent-wash" role="button">
      <div class="machine-number">
        <span class="tech-price-lg">03</span>
      </div>
      <div class="machine-info">
        <h3>WASH-03</h3>
        <span class="status status-success">Available</span>
      </div>
      <div class="machine-specs">
        <div class="spec">
          <svg class="icon icon-sm"><!-- Weight icon --></svg>
          <span>12 kg</span>
        </div>
        <div class="spec">
          <svg class="icon icon-sm"><!-- Timer icon --></svg>
          <span>45 min</span>
        </div>
      </div>
      <button class="btn btn-wash btn-sm">Select</button>
    </div>

    <!-- In-Use Machine -->
    <div class="card card-disabled">
      <div class="machine-number">
        <span class="tech-price-lg">05</span>
      </div>
      <div class="machine-info">
        <h3>WASH-05</h3>
        <span class="status status-warning">In Use</span>
      </div>
      <div class="machine-progress">
        <div class="progress-bar">
          <div class="progress-bar-fill" style="width: 60%;"></div>
        </div>
        <span>25 min remaining</span>
      </div>
    </div>

    <!-- Offline Machine -->
    <div class="card card-disabled">
      <div class="machine-number">
        <span class="tech-price-lg">07</span>
      </div>
      <div class="machine-info">
        <h3>WASH-07</h3>
        <span class="status status-error">Offline</span>
      </div>
      <p style="color: var(--text-muted);">Under maintenance</p>
    </div>
  </div>
</div>
```

### Machine Card States

| State | Visual | Interaction |
|-------|--------|-------------|
| Available | Green badge, selectable | Clickable, hover effect |
| In Use | Yellow badge, progress bar | Disabled, show time remaining |
| Offline | Red badge, muted colors | Disabled, show reason |
| Selected | Inverted colors, accent strip | Highlighted |

### Design Rules

#### ✅ DO
- Show real-time status updates
- Display machine specs clearly (capacity, time)
- Filter by service type
- Indicate remaining time for in-use machines
- Use large machine numbers (tech typography)

#### ❌ DON'T
- Hide offline machines (transparency)
- Allow selection of unavailable machines
- Use ambiguous status labels
- Omit time remaining information

---

## Service Selection Pattern

**Context:** Choosing wash/dry program
**Platforms:** All

### Layout

**Service Cards:**
- 2-3 column grid
- Service icon
- Program name
- Description
- Price
- Duration

**Example:**

```html
<div class="service-selection-screen">
  <header class="header">
    <button class="btn btn-ghost btn-icon">← Back</button>
    <h2>Select Program</h2>
  </header>

  <div class="card-grid card-grid-2">
    <div class="card card-service card-selectable card-accent-wash">
      <div class="card-service-icon">
        <svg class="icon icon-xl"><!-- Wash icon --></svg>
      </div>
      <h3 class="card-service-title">Standard Wash</h3>
      <p>Regular cycle for everyday clothes</p>
      <div class="service-specs">
        <span>45 min</span> • <span>40°C</span>
      </div>
      <div class="card-service-price">20.000₫</div>
      <button class="btn btn-wash btn-sm">Select</button>
    </div>

    <div class="card card-service card-selectable card-accent-wash">
      <div class="card-service-icon">
        <svg class="icon icon-xl"><!-- Delicate icon --></svg>
      </div>
      <h3 class="card-service-title">Delicate Wash</h3>
      <p>Gentle cycle for sensitive fabrics</p>
      <div class="service-specs">
        <span>60 min</span> • <span>30°C</span>
      </div>
      <div class="card-service-price">25.000₫</div>
      <button class="btn btn-wash btn-sm">Select</button>
    </div>

    <div class="card card-service card-selectable card-accent-dry">
      <div class="card-service-icon">
        <svg class="icon icon-xl"><!-- Dry icon --></svg>
      </div>
      <h3 class="card-service-title">Quick Dry</h3>
      <p>Fast drying for mixed fabrics</p>
      <div class="service-specs">
        <span>30 min</span> • <span>Medium heat</span>
      </div>
      <div class="card-service-price">15.000₫</div>
      <button class="btn btn-dry btn-sm">Select</button>
    </div>
  </div>
</div>
```

### Design Rules

#### ✅ DO
- Group by service type (wash/dry)
- Display price prominently (monospace)
- Include duration and temperature
- Use service color coding
- Show icon for each program

#### ❌ DON'T
- Mix service colors inappropriately
- Hide pricing until checkout
- Use technical jargon without explanation
- Omit duration information

---

## Status Display Pattern

**Context:** Real-time equipment monitoring
**Platforms:** Web dashboard, Mobile app

### Layout

**Status Grid:**
- All machines overview
- Color-coded status
- Time remaining
- Quick actions

**Example:**

```html
<div class="status-dashboard">
  <header class="header">
    <h2>Machine Status</h2>
    <div class="status-summary">
      <span><span class="status-dot status-dot-success"></span> 8 Available</span>
      <span><span class="status-dot status-dot-warning"></span> 10 In Use</span>
      <span><span class="status-dot status-dot-error"></span> 2 Offline</span>
    </div>
  </header>

  <div class="status-grid">
    <div class="card card-sm card-accent-success">
      <div class="machine-status-header">
        <strong class="tech-price">03</strong>
        <span class="status status-success">Available</span>
      </div>
      <p>Ready for service</p>
    </div>

    <div class="card card-sm card-accent-warning">
      <div class="machine-status-header">
        <strong class="tech-price">05</strong>
        <span class="status status-warning">In Use</span>
      </div>
      <div class="progress-bar">
        <div class="progress-bar-fill" style="width: 60%;"></div>
      </div>
      <p>25 min remaining</p>
    </div>

    <div class="card card-sm card-accent-error">
      <div class="machine-status-header">
        <strong class="tech-price">07</strong>
        <span class="status status-error">Offline</span>
      </div>
      <p>Maintenance required</p>
    </div>
  </div>
</div>
```

---

## Related Documentation

- [Components](./03-components.md) - Individual component reference
- [Platform Guidelines](./05-platform-guidelines.md) - Platform-specific adaptations
- [Animation](./06-animation.md) - Pattern animations
