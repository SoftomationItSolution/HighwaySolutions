// --------------------------------Bootstrap Bundle min js------------------------------------------





!(function (t, e) {
    "object" == typeof exports && "undefined" != typeof module ? (module.exports = e()) : "function" == typeof define && define.amd ? define(e) : ((t = "undefined" != typeof globalThis ? globalThis : t || self).bootstrap = e());
})(this, function () {
    "use strict";
    const t = "transitionend",
        e = (t) => {
            let e = t.getAttribute("data-bs-target");
            if (!e || "#" === e) {
                let i = t.getAttribute("href");
                if (!i || (!i.includes("#") && !i.startsWith("."))) return null;
                i.includes("#") && !i.startsWith("#") && (i = `#${i.split("#")[1]}`), (e = i && "#" !== i ? i.trim() : null);
            }
            return e;
        },
        i = (t) => {
            const i = e(t);
            return i && document.querySelector(i) ? i : null;
        },
        n = (t) => {
            const i = e(t);
            return i ? document.querySelector(i) : null;
        },
        s = (e) => {
            e.dispatchEvent(new Event(t));
        },
        o = (t) => !(!t || "object" != typeof t) && (void 0 !== t.jquery && (t = t[0]), void 0 !== t.nodeType),
        r = (t) => (o(t) ? (t.jquery ? t[0] : t) : "string" == typeof t && t.length > 0 ? document.querySelector(t) : null),
        a = (t, e, i) => {
            Object.keys(i).forEach((n) => {
                const s = i[n],
                    r = e[n],
                    a =
                        r && o(r)
                            ? "element"
                            : null == (l = r)
                            ? `${l}`
                            : {}.toString
                                  .call(l)
                                  .match(/\s([a-z]+)/i)[1]
                                  .toLowerCase();
                var l;
                if (!new RegExp(s).test(a)) throw new TypeError(`${t.toUpperCase()}: Option "${n}" provided type "${a}" but expected type "${s}".`);
            });
        },
        l = (t) => !(!o(t) || 0 === t.getClientRects().length) && "visible" === getComputedStyle(t).getPropertyValue("visibility"),
        c = (t) => !t || t.nodeType !== Node.ELEMENT_NODE || !!t.classList.contains("disabled") || (void 0 !== t.disabled ? t.disabled : t.hasAttribute("disabled") && "false" !== t.getAttribute("disabled")),
        h = (t) => {
            if (!document.documentElement.attachShadow) return null;
            if ("function" == typeof t.getRootNode) {
                const e = t.getRootNode();
                return e instanceof ShadowRoot ? e : null;
            }
            return t instanceof ShadowRoot ? t : t.parentNode ? h(t.parentNode) : null;
        },
        d = () => {},
        u = (t) => {
            t.offsetHeight;
        },
        f = () => {
            const { jQuery: t } = window;
            return t && !document.body.hasAttribute("data-bs-no-jquery") ? t : null;
        },
        p = [],
        m = () => "rtl" === document.documentElement.dir,
        g = (t) => {
            var e;
            (e = () => {
                const e = f();
                if (e) {
                    const i = t.NAME,
                        n = e.fn[i];
                    (e.fn[i] = t.jQueryInterface), (e.fn[i].Constructor = t), (e.fn[i].noConflict = () => ((e.fn[i] = n), t.jQueryInterface));
                }
            }),
                "loading" === document.readyState
                    ? (p.length ||
                          document.addEventListener("DOMContentLoaded", () => {
                              p.forEach((t) => t());
                          }),
                      p.push(e))
                    : e();
        },
        _ = (t) => {
            "function" == typeof t && t();
        },
        b = (e, i, n = !0) => {
            if (!n) return void _(e);
            const o =
                ((t) => {
                    if (!t) return 0;
                    let { transitionDuration: e, transitionDelay: i } = window.getComputedStyle(t);
                    const n = Number.parseFloat(e),
                        s = Number.parseFloat(i);
                    return n || s ? ((e = e.split(",")[0]), (i = i.split(",")[0]), 1e3 * (Number.parseFloat(e) + Number.parseFloat(i))) : 0;
                })(i) + 5;
            let r = !1;
            const a = ({ target: n }) => {
                n === i && ((r = !0), i.removeEventListener(t, a), _(e));
            };
            i.addEventListener(t, a),
                setTimeout(() => {
                    r || s(i);
                }, o);
        },
        v = (t, e, i, n) => {
            let s = t.indexOf(e);
            if (-1 === s) return t[!i && n ? t.length - 1 : 0];
            const o = t.length;
            return (s += i ? 1 : -1), n && (s = (s + o) % o), t[Math.max(0, Math.min(s, o - 1))];
        },
        y = /[^.]*(?=\..*)\.|.*/,
        w = /\..*/,
        E = /::\d+$/,
        A = {};
    let T = 1;
    const O = { mouseenter: "mouseover", mouseleave: "mouseout" },
        C = /^(mouseenter|mouseleave)/i,
        k = new Set([
            "click",
            "dblclick",
            "mouseup",
            "mousedown",
            "contextmenu",
            "mousewheel",
            "DOMMouseScroll",
            "mouseover",
            "mouseout",
            "mousemove",
            "selectstart",
            "selectend",
            "keydown",
            "keypress",
            "keyup",
            "orientationchange",
            "touchstart",
            "touchmove",
            "touchend",
            "touchcancel",
            "pointerdown",
            "pointermove",
            "pointerup",
            "pointerleave",
            "pointercancel",
            "gesturestart",
            "gesturechange",
            "gestureend",
            "focus",
            "blur",
            "change",
            "reset",
            "select",
            "submit",
            "focusin",
            "focusout",
            "load",
            "unload",
            "beforeunload",
            "resize",
            "move",
            "DOMContentLoaded",
            "readystatechange",
            "error",
            "abort",
            "scroll",
        ]);
    function L(t, e) {
        return (e && `${e}::${T++}`) || t.uidEvent || T++;
    }
    function x(t) {
        const e = L(t);
        return (t.uidEvent = e), (A[e] = A[e] || {}), A[e];
    }
    function D(t, e, i = null) {
        const n = Object.keys(t);
        for (let s = 0, o = n.length; s < o; s++) {
            const o = t[n[s]];
            if (o.originalHandler === e && o.delegationSelector === i) return o;
        }
        return null;
    }
    function S(t, e, i) {
        const n = "string" == typeof e,
            s = n ? i : e;
        let o = P(t);
        return k.has(o) || (o = t), [n, s, o];
    }
    function N(t, e, i, n, s) {
        if ("string" != typeof e || !t) return;
        if ((i || ((i = n), (n = null)), C.test(e))) {
            const t = (t) =>
                function (e) {
                    if (!e.relatedTarget || (e.relatedTarget !== e.delegateTarget && !e.delegateTarget.contains(e.relatedTarget))) return t.call(this, e);
                };
            n ? (n = t(n)) : (i = t(i));
        }
        const [o, r, a] = S(e, i, n),
            l = x(t),
            c = l[a] || (l[a] = {}),
            h = D(c, r, o ? i : null);
        if (h) return void (h.oneOff = h.oneOff && s);
        const d = L(r, e.replace(y, "")),
            u = o
                ? (function (t, e, i) {
                      return function n(s) {
                          const o = t.querySelectorAll(e);
                          for (let { target: r } = s; r && r !== this; r = r.parentNode) for (let a = o.length; a--; ) if (o[a] === r) return (s.delegateTarget = r), n.oneOff && j.off(t, s.type, e, i), i.apply(r, [s]);
                          return null;
                      };
                  })(t, i, n)
                : (function (t, e) {
                      return function i(n) {
                          return (n.delegateTarget = t), i.oneOff && j.off(t, n.type, e), e.apply(t, [n]);
                      };
                  })(t, i);
        (u.delegationSelector = o ? i : null), (u.originalHandler = r), (u.oneOff = s), (u.uidEvent = d), (c[d] = u), t.addEventListener(a, u, o);
    }
    function I(t, e, i, n, s) {
        const o = D(e[i], n, s);
        o && (t.removeEventListener(i, o, Boolean(s)), delete e[i][o.uidEvent]);
    }
    function P(t) {
        return (t = t.replace(w, "")), O[t] || t;
    }
    const j = {
            on(t, e, i, n) {
                N(t, e, i, n, !1);
            },
            one(t, e, i, n) {
                N(t, e, i, n, !0);
            },
            off(t, e, i, n) {
                if ("string" != typeof e || !t) return;
                const [s, o, r] = S(e, i, n),
                    a = r !== e,
                    l = x(t),
                    c = e.startsWith(".");
                if (void 0 !== o) {
                    if (!l || !l[r]) return;
                    return void I(t, l, r, o, s ? i : null);
                }
                c &&
                    Object.keys(l).forEach((i) => {
                        !(function (t, e, i, n) {
                            const s = e[i] || {};
                            Object.keys(s).forEach((o) => {
                                if (o.includes(n)) {
                                    const n = s[o];
                                    I(t, e, i, n.originalHandler, n.delegationSelector);
                                }
                            });
                        })(t, l, i, e.slice(1));
                    });
                const h = l[r] || {};
                Object.keys(h).forEach((i) => {
                    const n = i.replace(E, "");
                    if (!a || e.includes(n)) {
                        const e = h[i];
                        I(t, l, r, e.originalHandler, e.delegationSelector);
                    }
                });
            },
            trigger(t, e, i) {
                if ("string" != typeof e || !t) return null;
                const n = f(),
                    s = P(e),
                    o = e !== s,
                    r = k.has(s);
                let a,
                    l = !0,
                    c = !0,
                    h = !1,
                    d = null;
                return (
                    o && n && ((a = n.Event(e, i)), n(t).trigger(a), (l = !a.isPropagationStopped()), (c = !a.isImmediatePropagationStopped()), (h = a.isDefaultPrevented())),
                    r ? ((d = document.createEvent("HTMLEvents")), d.initEvent(s, l, !0)) : (d = new CustomEvent(e, { bubbles: l, cancelable: !0 })),
                    void 0 !== i &&
                        Object.keys(i).forEach((t) => {
                            Object.defineProperty(d, t, { get: () => i[t] });
                        }),
                    h && d.preventDefault(),
                    c && t.dispatchEvent(d),
                    d.defaultPrevented && void 0 !== a && a.preventDefault(),
                    d
                );
            },
        },
        M = new Map(),
        H = {
            set(t, e, i) {
                M.has(t) || M.set(t, new Map());
                const n = M.get(t);
                n.has(e) || 0 === n.size ? n.set(e, i) : console.error(`Bootstrap doesn't allow more than one instance per element. Bound instance: ${Array.from(n.keys())[0]}.`);
            },
            get: (t, e) => (M.has(t) && M.get(t).get(e)) || null,
            remove(t, e) {
                if (!M.has(t)) return;
                const i = M.get(t);
                i.delete(e), 0 === i.size && M.delete(t);
            },
        };
    class B {
        constructor(t) {
            (t = r(t)) && ((this._element = t), H.set(this._element, this.constructor.DATA_KEY, this));
        }
        dispose() {
            H.remove(this._element, this.constructor.DATA_KEY),
                j.off(this._element, this.constructor.EVENT_KEY),
                Object.getOwnPropertyNames(this).forEach((t) => {
                    this[t] = null;
                });
        }
        _queueCallback(t, e, i = !0) {
            b(t, e, i);
        }
        static getInstance(t) {
            return H.get(r(t), this.DATA_KEY);
        }
        static getOrCreateInstance(t, e = {}) {
            return this.getInstance(t) || new this(t, "object" == typeof e ? e : null);
        }
        static get VERSION() {
            return "5.1.3";
        }
        static get NAME() {
            throw new Error('You have to implement the static method "NAME", for each component!');
        }
        static get DATA_KEY() {
            return `bs.${this.NAME}`;
        }
        static get EVENT_KEY() {
            return `.${this.DATA_KEY}`;
        }
    }
    const R = (t, e = "hide") => {
        const i = `click.dismiss${t.EVENT_KEY}`,
            s = t.NAME;
        j.on(document, i, `[data-bs-dismiss="${s}"]`, function (i) {
            if ((["A", "AREA"].includes(this.tagName) && i.preventDefault(), c(this))) return;
            const o = n(this) || this.closest(`.${s}`);
            t.getOrCreateInstance(o)[e]();
        });
    };
    class W extends B {
        static get NAME() {
            return "alert";
        }
        close() {
            if (j.trigger(this._element, "close.bs.alert").defaultPrevented) return;
            this._element.classList.remove("show");
            const t = this._element.classList.contains("fade");
            this._queueCallback(() => this._destroyElement(), this._element, t);
        }
        _destroyElement() {
            this._element.remove(), j.trigger(this._element, "closed.bs.alert"), this.dispose();
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = W.getOrCreateInstance(this);
                if ("string" == typeof t) {
                    if (void 0 === e[t] || t.startsWith("_") || "constructor" === t) throw new TypeError(`No method named "${t}"`);
                    e[t](this);
                }
            });
        }
    }
    R(W, "close"), g(W);
    const $ = '[data-bs-toggle="button"]';
    class z extends B {
        static get NAME() {
            return "button";
        }
        toggle() {
            this._element.setAttribute("aria-pressed", this._element.classList.toggle("active"));
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = z.getOrCreateInstance(this);
                "toggle" === t && e[t]();
            });
        }
    }
    function q(t) {
        return "true" === t || ("false" !== t && (t === Number(t).toString() ? Number(t) : "" === t || "null" === t ? null : t));
    }
    function F(t) {
        return t.replace(/[A-Z]/g, (t) => `-${t.toLowerCase()}`);
    }
    j.on(document, "click.bs.button.data-api", $, (t) => {
        t.preventDefault();
        const e = t.target.closest($);
        z.getOrCreateInstance(e).toggle();
    }),
        g(z);
    const U = {
            setDataAttribute(t, e, i) {
                t.setAttribute(`data-bs-${F(e)}`, i);
            },
            removeDataAttribute(t, e) {
                t.removeAttribute(`data-bs-${F(e)}`);
            },
            getDataAttributes(t) {
                if (!t) return {};
                const e = {};
                return (
                    Object.keys(t.dataset)
                        .filter((t) => t.startsWith("bs"))
                        .forEach((i) => {
                            let n = i.replace(/^bs/, "");
                            (n = n.charAt(0).toLowerCase() + n.slice(1, n.length)), (e[n] = q(t.dataset[i]));
                        }),
                    e
                );
            },
            getDataAttribute: (t, e) => q(t.getAttribute(`data-bs-${F(e)}`)),
            offset(t) {
                const e = t.getBoundingClientRect();
                return { top: e.top + window.pageYOffset, left: e.left + window.pageXOffset };
            },
            position: (t) => ({ top: t.offsetTop, left: t.offsetLeft }),
        },
        V = {
            find: (t, e = document.documentElement) => [].concat(...Element.prototype.querySelectorAll.call(e, t)),
            findOne: (t, e = document.documentElement) => Element.prototype.querySelector.call(e, t),
            children: (t, e) => [].concat(...t.children).filter((t) => t.matches(e)),
            parents(t, e) {
                const i = [];
                let n = t.parentNode;
                for (; n && n.nodeType === Node.ELEMENT_NODE && 3 !== n.nodeType; ) n.matches(e) && i.push(n), (n = n.parentNode);
                return i;
            },
            prev(t, e) {
                let i = t.previousElementSibling;
                for (; i; ) {
                    if (i.matches(e)) return [i];
                    i = i.previousElementSibling;
                }
                return [];
            },
            next(t, e) {
                let i = t.nextElementSibling;
                for (; i; ) {
                    if (i.matches(e)) return [i];
                    i = i.nextElementSibling;
                }
                return [];
            },
            focusableChildren(t) {
                const e = ["a", "button", "input", "textarea", "select", "details", "[tabindex]", '[contenteditable="true"]'].map((t) => `${t}:not([tabindex^="-"])`).join(", ");
                return this.find(e, t).filter((t) => !c(t) && l(t));
            },
        },
        K = "carousel",
        X = { interval: 5e3, keyboard: !0, slide: !1, pause: "hover", wrap: !0, touch: !0 },
        Y = { interval: "(number|boolean)", keyboard: "boolean", slide: "(boolean|string)", pause: "(string|boolean)", wrap: "boolean", touch: "boolean" },
        Q = "next",
        G = "prev",
        Z = "left",
        J = "right",
        tt = { ArrowLeft: J, ArrowRight: Z },
        et = "slid.bs.carousel",
        it = "active",
        nt = ".active.carousel-item";
    class st extends B {
        constructor(t, e) {
            super(t),
                (this._items = null),
                (this._interval = null),
                (this._activeElement = null),
                (this._isPaused = !1),
                (this._isSliding = !1),
                (this.touchTimeout = null),
                (this.touchStartX = 0),
                (this.touchDeltaX = 0),
                (this._config = this._getConfig(e)),
                (this._indicatorsElement = V.findOne(".carousel-indicators", this._element)),
                (this._touchSupported = "ontouchstart" in document.documentElement || navigator.maxTouchPoints > 0),
                (this._pointerEvent = Boolean(window.PointerEvent)),
                this._addEventListeners();
        }
        static get Default() {
            return X;
        }
        static get NAME() {
            return K;
        }
        next() {
            this._slide(Q);
        }
        nextWhenVisible() {
            !document.hidden && l(this._element) && this.next();
        }
        prev() {
            this._slide(G);
        }
        pause(t) {
            t || (this._isPaused = !0), V.findOne(".carousel-item-next, .carousel-item-prev", this._element) && (s(this._element), this.cycle(!0)), clearInterval(this._interval), (this._interval = null);
        }
        cycle(t) {
            t || (this._isPaused = !1),
                this._interval && (clearInterval(this._interval), (this._interval = null)),
                this._config && this._config.interval && !this._isPaused && (this._updateInterval(), (this._interval = setInterval((document.visibilityState ? this.nextWhenVisible : this.next).bind(this), this._config.interval)));
        }
        to(t) {
            this._activeElement = V.findOne(nt, this._element);
            const e = this._getItemIndex(this._activeElement);
            if (t > this._items.length - 1 || t < 0) return;
            if (this._isSliding) return void j.one(this._element, et, () => this.to(t));
            if (e === t) return this.pause(), void this.cycle();
            const i = t > e ? Q : G;
            this._slide(i, this._items[t]);
        }
        _getConfig(t) {
            return (t = { ...X, ...U.getDataAttributes(this._element), ...("object" == typeof t ? t : {}) }), a(K, t, Y), t;
        }
        _handleSwipe() {
            const t = Math.abs(this.touchDeltaX);
            if (t <= 40) return;
            const e = t / this.touchDeltaX;
            (this.touchDeltaX = 0), e && this._slide(e > 0 ? J : Z);
        }
        _addEventListeners() {
            this._config.keyboard && j.on(this._element, "keydown.bs.carousel", (t) => this._keydown(t)),
                "hover" === this._config.pause && (j.on(this._element, "mouseenter.bs.carousel", (t) => this.pause(t)), j.on(this._element, "mouseleave.bs.carousel", (t) => this.cycle(t))),
                this._config.touch && this._touchSupported && this._addTouchEventListeners();
        }
        _addTouchEventListeners() {
            const t = (t) => this._pointerEvent && ("pen" === t.pointerType || "touch" === t.pointerType),
                e = (e) => {
                    t(e) ? (this.touchStartX = e.clientX) : this._pointerEvent || (this.touchStartX = e.touches[0].clientX);
                },
                i = (t) => {
                    this.touchDeltaX = t.touches && t.touches.length > 1 ? 0 : t.touches[0].clientX - this.touchStartX;
                },
                n = (e) => {
                    t(e) && (this.touchDeltaX = e.clientX - this.touchStartX),
                        this._handleSwipe(),
                        "hover" === this._config.pause && (this.pause(), this.touchTimeout && clearTimeout(this.touchTimeout), (this.touchTimeout = setTimeout((t) => this.cycle(t), 500 + this._config.interval)));
                };
            V.find(".carousel-item img", this._element).forEach((t) => {
                j.on(t, "dragstart.bs.carousel", (t) => t.preventDefault());
            }),
                this._pointerEvent
                    ? (j.on(this._element, "pointerdown.bs.carousel", (t) => e(t)), j.on(this._element, "pointerup.bs.carousel", (t) => n(t)), this._element.classList.add("pointer-event"))
                    : (j.on(this._element, "touchstart.bs.carousel", (t) => e(t)), j.on(this._element, "touchmove.bs.carousel", (t) => i(t)), j.on(this._element, "touchend.bs.carousel", (t) => n(t)));
        }
        _keydown(t) {
            if (/input|textarea/i.test(t.target.tagName)) return;
            const e = tt[t.key];
            e && (t.preventDefault(), this._slide(e));
        }
        _getItemIndex(t) {
            return (this._items = t && t.parentNode ? V.find(".carousel-item", t.parentNode) : []), this._items.indexOf(t);
        }
        _getItemByOrder(t, e) {
            const i = t === Q;
            return v(this._items, e, i, this._config.wrap);
        }
        _triggerSlideEvent(t, e) {
            const i = this._getItemIndex(t),
                n = this._getItemIndex(V.findOne(nt, this._element));
            return j.trigger(this._element, "slide.bs.carousel", { relatedTarget: t, direction: e, from: n, to: i });
        }
        _setActiveIndicatorElement(t) {
            if (this._indicatorsElement) {
                const e = V.findOne(".active", this._indicatorsElement);
                e.classList.remove(it), e.removeAttribute("aria-current");
                const i = V.find("[data-bs-target]", this._indicatorsElement);
                for (let e = 0; e < i.length; e++)
                    if (Number.parseInt(i[e].getAttribute("data-bs-slide-to"), 10) === this._getItemIndex(t)) {
                        i[e].classList.add(it), i[e].setAttribute("aria-current", "true");
                        break;
                    }
            }
        }
        _updateInterval() {
            const t = this._activeElement || V.findOne(nt, this._element);
            if (!t) return;
            const e = Number.parseInt(t.getAttribute("data-bs-interval"), 10);
            e ? ((this._config.defaultInterval = this._config.defaultInterval || this._config.interval), (this._config.interval = e)) : (this._config.interval = this._config.defaultInterval || this._config.interval);
        }
        _slide(t, e) {
            const i = this._directionToOrder(t),
                n = V.findOne(nt, this._element),
                s = this._getItemIndex(n),
                o = e || this._getItemByOrder(i, n),
                r = this._getItemIndex(o),
                a = Boolean(this._interval),
                l = i === Q,
                c = l ? "carousel-item-start" : "carousel-item-end",
                h = l ? "carousel-item-next" : "carousel-item-prev",
                d = this._orderToDirection(i);
            if (o && o.classList.contains(it)) return void (this._isSliding = !1);
            if (this._isSliding) return;
            if (this._triggerSlideEvent(o, d).defaultPrevented) return;
            if (!n || !o) return;
            (this._isSliding = !0), a && this.pause(), this._setActiveIndicatorElement(o), (this._activeElement = o);
            const f = () => {
                j.trigger(this._element, et, { relatedTarget: o, direction: d, from: s, to: r });
            };
            if (this._element.classList.contains("slide")) {
                o.classList.add(h), u(o), n.classList.add(c), o.classList.add(c);
                const t = () => {
                    o.classList.remove(c, h), o.classList.add(it), n.classList.remove(it, h, c), (this._isSliding = !1), setTimeout(f, 0);
                };
                this._queueCallback(t, n, !0);
            } else n.classList.remove(it), o.classList.add(it), (this._isSliding = !1), f();
            a && this.cycle();
        }
        _directionToOrder(t) {
            return [J, Z].includes(t) ? (m() ? (t === Z ? G : Q) : t === Z ? Q : G) : t;
        }
        _orderToDirection(t) {
            return [Q, G].includes(t) ? (m() ? (t === G ? Z : J) : t === G ? J : Z) : t;
        }
        static carouselInterface(t, e) {
            const i = st.getOrCreateInstance(t, e);
            let { _config: n } = i;
            "object" == typeof e && (n = { ...n, ...e });
            const s = "string" == typeof e ? e : n.slide;
            if ("number" == typeof e) i.to(e);
            else if ("string" == typeof s) {
                if (void 0 === i[s]) throw new TypeError(`No method named "${s}"`);
                i[s]();
            } else n.interval && n.ride && (i.pause(), i.cycle());
        }
        static jQueryInterface(t) {
            return this.each(function () {
                st.carouselInterface(this, t);
            });
        }
        static dataApiClickHandler(t) {
            const e = n(this);
            if (!e || !e.classList.contains("carousel")) return;
            const i = { ...U.getDataAttributes(e), ...U.getDataAttributes(this) },
                s = this.getAttribute("data-bs-slide-to");
            s && (i.interval = !1), st.carouselInterface(e, i), s && st.getInstance(e).to(s), t.preventDefault();
        }
    }
    j.on(document, "click.bs.carousel.data-api", "[data-bs-slide], [data-bs-slide-to]", st.dataApiClickHandler),
        j.on(window, "load.bs.carousel.data-api", () => {
            const t = V.find('[data-bs-ride="carousel"]');
            for (let e = 0, i = t.length; e < i; e++) st.carouselInterface(t[e], st.getInstance(t[e]));
        }),
        g(st);
    const ot = "collapse",
        rt = { toggle: !0, parent: null },
        at = { toggle: "boolean", parent: "(null|element)" },
        lt = "show",
        ct = "collapse",
        ht = "collapsing",
        dt = "collapsed",
        ut = ":scope .collapse .collapse",
        ft = '[data-bs-toggle="collapse"]';
    class pt extends B {
        constructor(t, e) {
            super(t), (this._isTransitioning = !1), (this._config = this._getConfig(e)), (this._triggerArray = []);
            const n = V.find(ft);
            for (let t = 0, e = n.length; t < e; t++) {
                const e = n[t],
                    s = i(e),
                    o = V.find(s).filter((t) => t === this._element);
                null !== s && o.length && ((this._selector = s), this._triggerArray.push(e));
            }
            this._initializeChildren(), this._config.parent || this._addAriaAndCollapsedClass(this._triggerArray, this._isShown()), this._config.toggle && this.toggle();
        }
        static get Default() {
            return rt;
        }
        static get NAME() {
            return ot;
        }
        toggle() {
            this._isShown() ? this.hide() : this.show();
        }
        show() {
            if (this._isTransitioning || this._isShown()) return;
            let t,
                e = [];
            if (this._config.parent) {
                const t = V.find(ut, this._config.parent);
                e = V.find(".collapse.show, .collapse.collapsing", this._config.parent).filter((e) => !t.includes(e));
            }
            const i = V.findOne(this._selector);
            if (e.length) {
                const n = e.find((t) => i !== t);
                if (((t = n ? pt.getInstance(n) : null), t && t._isTransitioning)) return;
            }
            if (j.trigger(this._element, "show.bs.collapse").defaultPrevented) return;
            e.forEach((e) => {
                i !== e && pt.getOrCreateInstance(e, { toggle: !1 }).hide(), t || H.set(e, "bs.collapse", null);
            });
            const n = this._getDimension();
            this._element.classList.remove(ct), this._element.classList.add(ht), (this._element.style[n] = 0), this._addAriaAndCollapsedClass(this._triggerArray, !0), (this._isTransitioning = !0);
            const s = `scroll${n[0].toUpperCase() + n.slice(1)}`;
            this._queueCallback(
                () => {
                    (this._isTransitioning = !1), this._element.classList.remove(ht), this._element.classList.add(ct, lt), (this._element.style[n] = ""), j.trigger(this._element, "shown.bs.collapse");
                },
                this._element,
                !0
            ),
                (this._element.style[n] = `${this._element[s]}px`);
        }
        hide() {
            if (this._isTransitioning || !this._isShown()) return;
            if (j.trigger(this._element, "hide.bs.collapse").defaultPrevented) return;
            const t = this._getDimension();
            (this._element.style[t] = `${this._element.getBoundingClientRect()[t]}px`), u(this._element), this._element.classList.add(ht), this._element.classList.remove(ct, lt);
            const e = this._triggerArray.length;
            for (let t = 0; t < e; t++) {
                const e = this._triggerArray[t],
                    i = n(e);
                i && !this._isShown(i) && this._addAriaAndCollapsedClass([e], !1);
            }
            (this._isTransitioning = !0),
                (this._element.style[t] = ""),
                this._queueCallback(
                    () => {
                        (this._isTransitioning = !1), this._element.classList.remove(ht), this._element.classList.add(ct), j.trigger(this._element, "hidden.bs.collapse");
                    },
                    this._element,
                    !0
                );
        }
        _isShown(t = this._element) {
            return t.classList.contains(lt);
        }
        _getConfig(t) {
            return ((t = { ...rt, ...U.getDataAttributes(this._element), ...t }).toggle = Boolean(t.toggle)), (t.parent = r(t.parent)), a(ot, t, at), t;
        }
        _getDimension() {
            return this._element.classList.contains("collapse-horizontal") ? "width" : "height";
        }
        _initializeChildren() {
            if (!this._config.parent) return;
            const t = V.find(ut, this._config.parent);
            V.find(ft, this._config.parent)
                .filter((e) => !t.includes(e))
                .forEach((t) => {
                    const e = n(t);
                    e && this._addAriaAndCollapsedClass([t], this._isShown(e));
                });
        }
        _addAriaAndCollapsedClass(t, e) {
            t.length &&
                t.forEach((t) => {
                    e ? t.classList.remove(dt) : t.classList.add(dt), t.setAttribute("aria-expanded", e);
                });
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = {};
                "string" == typeof t && /show|hide/.test(t) && (e.toggle = !1);
                const i = pt.getOrCreateInstance(this, e);
                if ("string" == typeof t) {
                    if (void 0 === i[t]) throw new TypeError(`No method named "${t}"`);
                    i[t]();
                }
            });
        }
    }
    j.on(document, "click.bs.collapse.data-api", ft, function (t) {
        ("A" === t.target.tagName || (t.delegateTarget && "A" === t.delegateTarget.tagName)) && t.preventDefault();
        const e = i(this);
        V.find(e).forEach((t) => {
            pt.getOrCreateInstance(t, { toggle: !1 }).toggle();
        });
    }),
        g(pt);
    var mt = "top",
        gt = "bottom",
        _t = "right",
        bt = "left",
        vt = "auto",
        yt = [mt, gt, _t, bt],
        wt = "start",
        Et = "end",
        At = "clippingParents",
        Tt = "viewport",
        Ot = "popper",
        Ct = "reference",
        kt = yt.reduce(function (t, e) {
            return t.concat([e + "-" + wt, e + "-" + Et]);
        }, []),
        Lt = [].concat(yt, [vt]).reduce(function (t, e) {
            return t.concat([e, e + "-" + wt, e + "-" + Et]);
        }, []),
        xt = "beforeRead",
        Dt = "read",
        St = "afterRead",
        Nt = "beforeMain",
        It = "main",
        Pt = "afterMain",
        jt = "beforeWrite",
        Mt = "write",
        Ht = "afterWrite",
        Bt = [xt, Dt, St, Nt, It, Pt, jt, Mt, Ht];
    function Rt(t) {
        return t ? (t.nodeName || "").toLowerCase() : null;
    }
    function Wt(t) {
        if (null == t) return window;
        if ("[object Window]" !== t.toString()) {
            var e = t.ownerDocument;
            return (e && e.defaultView) || window;
        }
        return t;
    }
    function $t(t) {
        return t instanceof Wt(t).Element || t instanceof Element;
    }
    function zt(t) {
        return t instanceof Wt(t).HTMLElement || t instanceof HTMLElement;
    }
    function qt(t) {
        return "undefined" != typeof ShadowRoot && (t instanceof Wt(t).ShadowRoot || t instanceof ShadowRoot);
    }
    const Ft = {
        name: "applyStyles",
        enabled: !0,
        phase: "write",
        fn: function (t) {
            var e = t.state;
            Object.keys(e.elements).forEach(function (t) {
                var i = e.styles[t] || {},
                    n = e.attributes[t] || {},
                    s = e.elements[t];
                zt(s) &&
                    Rt(s) &&
                    (Object.assign(s.style, i),
                    Object.keys(n).forEach(function (t) {
                        var e = n[t];
                        !1 === e ? s.removeAttribute(t) : s.setAttribute(t, !0 === e ? "" : e);
                    }));
            });
        },
        effect: function (t) {
            var e = t.state,
                i = { popper: { position: e.options.strategy, left: "0", top: "0", margin: "0" }, arrow: { position: "absolute" }, reference: {} };
            return (
                Object.assign(e.elements.popper.style, i.popper),
                (e.styles = i),
                e.elements.arrow && Object.assign(e.elements.arrow.style, i.arrow),
                function () {
                    Object.keys(e.elements).forEach(function (t) {
                        var n = e.elements[t],
                            s = e.attributes[t] || {},
                            o = Object.keys(e.styles.hasOwnProperty(t) ? e.styles[t] : i[t]).reduce(function (t, e) {
                                return (t[e] = ""), t;
                            }, {});
                        zt(n) &&
                            Rt(n) &&
                            (Object.assign(n.style, o),
                            Object.keys(s).forEach(function (t) {
                                n.removeAttribute(t);
                            }));
                    });
                }
            );
        },
        requires: ["computeStyles"],
    };
    function Ut(t) {
        return t.split("-")[0];
    }
    function Vt(t, e) {
        var i = t.getBoundingClientRect();
        return { width: i.width / 1, height: i.height / 1, top: i.top / 1, right: i.right / 1, bottom: i.bottom / 1, left: i.left / 1, x: i.left / 1, y: i.top / 1 };
    }
    function Kt(t) {
        var e = Vt(t),
            i = t.offsetWidth,
            n = t.offsetHeight;
        return Math.abs(e.width - i) <= 1 && (i = e.width), Math.abs(e.height - n) <= 1 && (n = e.height), { x: t.offsetLeft, y: t.offsetTop, width: i, height: n };
    }
    function Xt(t, e) {
        var i = e.getRootNode && e.getRootNode();
        if (t.contains(e)) return !0;
        if (i && qt(i)) {
            var n = e;
            do {
                if (n && t.isSameNode(n)) return !0;
                n = n.parentNode || n.host;
            } while (n);
        }
        return !1;
    }
    function Yt(t) {
        return Wt(t).getComputedStyle(t);
    }
    function Qt(t) {
        return ["table", "td", "th"].indexOf(Rt(t)) >= 0;
    }
    function Gt(t) {
        return (($t(t) ? t.ownerDocument : t.document) || window.document).documentElement;
    }
    function Zt(t) {
        return "html" === Rt(t) ? t : t.assignedSlot || t.parentNode || (qt(t) ? t.host : null) || Gt(t);
    }
    function Jt(t) {
        return zt(t) && "fixed" !== Yt(t).position ? t.offsetParent : null;
    }
    function te(t) {
        for (var e = Wt(t), i = Jt(t); i && Qt(i) && "static" === Yt(i).position; ) i = Jt(i);
        return i && ("html" === Rt(i) || ("body" === Rt(i) && "static" === Yt(i).position))
            ? e
            : i ||
                  (function (t) {
                      var e = -1 !== navigator.userAgent.toLowerCase().indexOf("firefox");
                      if (-1 !== navigator.userAgent.indexOf("Trident") && zt(t) && "fixed" === Yt(t).position) return null;
                      for (var i = Zt(t); zt(i) && ["html", "body"].indexOf(Rt(i)) < 0; ) {
                          var n = Yt(i);
                          if (
                              "none" !== n.transform ||
                              "none" !== n.perspective ||
                              "paint" === n.contain ||
                              -1 !== ["transform", "perspective"].indexOf(n.willChange) ||
                              (e && "filter" === n.willChange) ||
                              (e && n.filter && "none" !== n.filter)
                          )
                              return i;
                          i = i.parentNode;
                      }
                      return null;
                  })(t) ||
                  e;
    }
    function ee(t) {
        return ["top", "bottom"].indexOf(t) >= 0 ? "x" : "y";
    }
    var ie = Math.max,
        ne = Math.min,
        se = Math.round;
    function oe(t, e, i) {
        return ie(t, ne(e, i));
    }
    function re(t) {
        return Object.assign({}, { top: 0, right: 0, bottom: 0, left: 0 }, t);
    }
    function ae(t, e) {
        return e.reduce(function (e, i) {
            return (e[i] = t), e;
        }, {});
    }
    const le = {
        name: "arrow",
        enabled: !0,
        phase: "main",
        fn: function (t) {
            var e,
                i = t.state,
                n = t.name,
                s = t.options,
                o = i.elements.arrow,
                r = i.modifiersData.popperOffsets,
                a = Ut(i.placement),
                l = ee(a),
                c = [bt, _t].indexOf(a) >= 0 ? "height" : "width";
            if (o && r) {
                var h = (function (t, e) {
                        return re("number" != typeof (t = "function" == typeof t ? t(Object.assign({}, e.rects, { placement: e.placement })) : t) ? t : ae(t, yt));
                    })(s.padding, i),
                    d = Kt(o),
                    u = "y" === l ? mt : bt,
                    f = "y" === l ? gt : _t,
                    p = i.rects.reference[c] + i.rects.reference[l] - r[l] - i.rects.popper[c],
                    m = r[l] - i.rects.reference[l],
                    g = te(o),
                    _ = g ? ("y" === l ? g.clientHeight || 0 : g.clientWidth || 0) : 0,
                    b = p / 2 - m / 2,
                    v = h[u],
                    y = _ - d[c] - h[f],
                    w = _ / 2 - d[c] / 2 + b,
                    E = oe(v, w, y),
                    A = l;
                i.modifiersData[n] = (((e = {})[A] = E), (e.centerOffset = E - w), e);
            }
        },
        effect: function (t) {
            var e = t.state,
                i = t.options.element,
                n = void 0 === i ? "[data-popper-arrow]" : i;
            null != n && ("string" != typeof n || (n = e.elements.popper.querySelector(n))) && Xt(e.elements.popper, n) && (e.elements.arrow = n);
        },
        requires: ["popperOffsets"],
        requiresIfExists: ["preventOverflow"],
    };
    function ce(t) {
        return t.split("-")[1];
    }
    var he = { top: "auto", right: "auto", bottom: "auto", left: "auto" };
    function de(t) {
        var e,
            i = t.popper,
            n = t.popperRect,
            s = t.placement,
            o = t.variation,
            r = t.offsets,
            a = t.position,
            l = t.gpuAcceleration,
            c = t.adaptive,
            h = t.roundOffsets,
            d =
                !0 === h
                    ? (function (t) {
                          var e = t.x,
                              i = t.y,
                              n = window.devicePixelRatio || 1;
                          return { x: se(se(e * n) / n) || 0, y: se(se(i * n) / n) || 0 };
                      })(r)
                    : "function" == typeof h
                    ? h(r)
                    : r,
            u = d.x,
            f = void 0 === u ? 0 : u,
            p = d.y,
            m = void 0 === p ? 0 : p,
            g = r.hasOwnProperty("x"),
            _ = r.hasOwnProperty("y"),
            b = bt,
            v = mt,
            y = window;
        if (c) {
            var w = te(i),
                E = "clientHeight",
                A = "clientWidth";
            w === Wt(i) && "static" !== Yt((w = Gt(i))).position && "absolute" === a && ((E = "scrollHeight"), (A = "scrollWidth")),
                (w = w),
                (s !== mt && ((s !== bt && s !== _t) || o !== Et)) || ((v = gt), (m -= w[E] - n.height), (m *= l ? 1 : -1)),
                (s !== bt && ((s !== mt && s !== gt) || o !== Et)) || ((b = _t), (f -= w[A] - n.width), (f *= l ? 1 : -1));
        }
        var T,
            O = Object.assign({ position: a }, c && he);
        return l
            ? Object.assign({}, O, (((T = {})[v] = _ ? "0" : ""), (T[b] = g ? "0" : ""), (T.transform = (y.devicePixelRatio || 1) <= 1 ? "translate(" + f + "px, " + m + "px)" : "translate3d(" + f + "px, " + m + "px, 0)"), T))
            : Object.assign({}, O, (((e = {})[v] = _ ? m + "px" : ""), (e[b] = g ? f + "px" : ""), (e.transform = ""), e));
    }
    const ue = {
        name: "computeStyles",
        enabled: !0,
        phase: "beforeWrite",
        fn: function (t) {
            var e = t.state,
                i = t.options,
                n = i.gpuAcceleration,
                s = void 0 === n || n,
                o = i.adaptive,
                r = void 0 === o || o,
                a = i.roundOffsets,
                l = void 0 === a || a,
                c = { placement: Ut(e.placement), variation: ce(e.placement), popper: e.elements.popper, popperRect: e.rects.popper, gpuAcceleration: s };
            null != e.modifiersData.popperOffsets && (e.styles.popper = Object.assign({}, e.styles.popper, de(Object.assign({}, c, { offsets: e.modifiersData.popperOffsets, position: e.options.strategy, adaptive: r, roundOffsets: l })))),
                null != e.modifiersData.arrow && (e.styles.arrow = Object.assign({}, e.styles.arrow, de(Object.assign({}, c, { offsets: e.modifiersData.arrow, position: "absolute", adaptive: !1, roundOffsets: l })))),
                (e.attributes.popper = Object.assign({}, e.attributes.popper, { "data-popper-placement": e.placement }));
        },
        data: {},
    };
    var fe = { passive: !0 };
    const pe = {
        name: "eventListeners",
        enabled: !0,
        phase: "write",
        fn: function () {},
        effect: function (t) {
            var e = t.state,
                i = t.instance,
                n = t.options,
                s = n.scroll,
                o = void 0 === s || s,
                r = n.resize,
                a = void 0 === r || r,
                l = Wt(e.elements.popper),
                c = [].concat(e.scrollParents.reference, e.scrollParents.popper);
            return (
                o &&
                    c.forEach(function (t) {
                        t.addEventListener("scroll", i.update, fe);
                    }),
                a && l.addEventListener("resize", i.update, fe),
                function () {
                    o &&
                        c.forEach(function (t) {
                            t.removeEventListener("scroll", i.update, fe);
                        }),
                        a && l.removeEventListener("resize", i.update, fe);
                }
            );
        },
        data: {},
    };
    var me = { left: "right", right: "left", bottom: "top", top: "bottom" };
    function ge(t) {
        return t.replace(/left|right|bottom|top/g, function (t) {
            return me[t];
        });
    }
    var _e = { start: "end", end: "start" };
    function be(t) {
        return t.replace(/start|end/g, function (t) {
            return _e[t];
        });
    }
    function ve(t) {
        var e = Wt(t);
        return { scrollLeft: e.pageXOffset, scrollTop: e.pageYOffset };
    }
    function ye(t) {
        return Vt(Gt(t)).left + ve(t).scrollLeft;
    }
    function we(t) {
        var e = Yt(t),
            i = e.overflow,
            n = e.overflowX,
            s = e.overflowY;
        return /auto|scroll|overlay|hidden/.test(i + s + n);
    }
    function Ee(t) {
        return ["html", "body", "#document"].indexOf(Rt(t)) >= 0 ? t.ownerDocument.body : zt(t) && we(t) ? t : Ee(Zt(t));
    }
    function Ae(t, e) {
        var i;
        void 0 === e && (e = []);
        var n = Ee(t),
            s = n === (null == (i = t.ownerDocument) ? void 0 : i.body),
            o = Wt(n),
            r = s ? [o].concat(o.visualViewport || [], we(n) ? n : []) : n,
            a = e.concat(r);
        return s ? a : a.concat(Ae(Zt(r)));
    }
    function Te(t) {
        return Object.assign({}, t, { left: t.x, top: t.y, right: t.x + t.width, bottom: t.y + t.height });
    }
    function Oe(t, e) {
        return e === Tt
            ? Te(
                  (function (t) {
                      var e = Wt(t),
                          i = Gt(t),
                          n = e.visualViewport,
                          s = i.clientWidth,
                          o = i.clientHeight,
                          r = 0,
                          a = 0;
                      return n && ((s = n.width), (o = n.height), /^((?!chrome|android).)*safari/i.test(navigator.userAgent) || ((r = n.offsetLeft), (a = n.offsetTop))), { width: s, height: o, x: r + ye(t), y: a };
                  })(t)
              )
            : zt(e)
            ? (function (t) {
                  var e = Vt(t);
                  return (
                      (e.top = e.top + t.clientTop),
                      (e.left = e.left + t.clientLeft),
                      (e.bottom = e.top + t.clientHeight),
                      (e.right = e.left + t.clientWidth),
                      (e.width = t.clientWidth),
                      (e.height = t.clientHeight),
                      (e.x = e.left),
                      (e.y = e.top),
                      e
                  );
              })(e)
            : Te(
                  (function (t) {
                      var e,
                          i = Gt(t),
                          n = ve(t),
                          s = null == (e = t.ownerDocument) ? void 0 : e.body,
                          o = ie(i.scrollWidth, i.clientWidth, s ? s.scrollWidth : 0, s ? s.clientWidth : 0),
                          r = ie(i.scrollHeight, i.clientHeight, s ? s.scrollHeight : 0, s ? s.clientHeight : 0),
                          a = -n.scrollLeft + ye(t),
                          l = -n.scrollTop;
                      return "rtl" === Yt(s || i).direction && (a += ie(i.clientWidth, s ? s.clientWidth : 0) - o), { width: o, height: r, x: a, y: l };
                  })(Gt(t))
              );
    }
    function Ce(t) {
        var e,
            i = t.reference,
            n = t.element,
            s = t.placement,
            o = s ? Ut(s) : null,
            r = s ? ce(s) : null,
            a = i.x + i.width / 2 - n.width / 2,
            l = i.y + i.height / 2 - n.height / 2;
        switch (o) {
            case mt:
                e = { x: a, y: i.y - n.height };
                break;
            case gt:
                e = { x: a, y: i.y + i.height };
                break;
            case _t:
                e = { x: i.x + i.width, y: l };
                break;
            case bt:
                e = { x: i.x - n.width, y: l };
                break;
            default:
                e = { x: i.x, y: i.y };
        }
        var c = o ? ee(o) : null;
        if (null != c) {
            var h = "y" === c ? "height" : "width";
            switch (r) {
                case wt:
                    e[c] = e[c] - (i[h] / 2 - n[h] / 2);
                    break;
                case Et:
                    e[c] = e[c] + (i[h] / 2 - n[h] / 2);
            }
        }
        return e;
    }
    function ke(t, e) {
        void 0 === e && (e = {});
        var i = e,
            n = i.placement,
            s = void 0 === n ? t.placement : n,
            o = i.boundary,
            r = void 0 === o ? At : o,
            a = i.rootBoundary,
            l = void 0 === a ? Tt : a,
            c = i.elementContext,
            h = void 0 === c ? Ot : c,
            d = i.altBoundary,
            u = void 0 !== d && d,
            f = i.padding,
            p = void 0 === f ? 0 : f,
            m = re("number" != typeof p ? p : ae(p, yt)),
            g = h === Ot ? Ct : Ot,
            _ = t.rects.popper,
            b = t.elements[u ? g : h],
            v = (function (t, e, i) {
                var n =
                        "clippingParents" === e
                            ? (function (t) {
                                  var e = Ae(Zt(t)),
                                      i = ["absolute", "fixed"].indexOf(Yt(t).position) >= 0 && zt(t) ? te(t) : t;
                                  return $t(i)
                                      ? e.filter(function (t) {
                                            return $t(t) && Xt(t, i) && "body" !== Rt(t);
                                        })
                                      : [];
                              })(t)
                            : [].concat(e),
                    s = [].concat(n, [i]),
                    o = s[0],
                    r = s.reduce(function (e, i) {
                        var n = Oe(t, i);
                        return (e.top = ie(n.top, e.top)), (e.right = ne(n.right, e.right)), (e.bottom = ne(n.bottom, e.bottom)), (e.left = ie(n.left, e.left)), e;
                    }, Oe(t, o));
                return (r.width = r.right - r.left), (r.height = r.bottom - r.top), (r.x = r.left), (r.y = r.top), r;
            })($t(b) ? b : b.contextElement || Gt(t.elements.popper), r, l),
            y = Vt(t.elements.reference),
            w = Ce({ reference: y, element: _, strategy: "absolute", placement: s }),
            E = Te(Object.assign({}, _, w)),
            A = h === Ot ? E : y,
            T = { top: v.top - A.top + m.top, bottom: A.bottom - v.bottom + m.bottom, left: v.left - A.left + m.left, right: A.right - v.right + m.right },
            O = t.modifiersData.offset;
        if (h === Ot && O) {
            var C = O[s];
            Object.keys(T).forEach(function (t) {
                var e = [_t, gt].indexOf(t) >= 0 ? 1 : -1,
                    i = [mt, gt].indexOf(t) >= 0 ? "y" : "x";
                T[t] += C[i] * e;
            });
        }
        return T;
    }
    function Le(t, e) {
        void 0 === e && (e = {});
        var i = e,
            n = i.placement,
            s = i.boundary,
            o = i.rootBoundary,
            r = i.padding,
            a = i.flipVariations,
            l = i.allowedAutoPlacements,
            c = void 0 === l ? Lt : l,
            h = ce(n),
            d = h
                ? a
                    ? kt
                    : kt.filter(function (t) {
                          return ce(t) === h;
                      })
                : yt,
            u = d.filter(function (t) {
                return c.indexOf(t) >= 0;
            });
        0 === u.length && (u = d);
        var f = u.reduce(function (e, i) {
            return (e[i] = ke(t, { placement: i, boundary: s, rootBoundary: o, padding: r })[Ut(i)]), e;
        }, {});
        return Object.keys(f).sort(function (t, e) {
            return f[t] - f[e];
        });
    }
    const xe = {
        name: "flip",
        enabled: !0,
        phase: "main",
        fn: function (t) {
            var e = t.state,
                i = t.options,
                n = t.name;
            if (!e.modifiersData[n]._skip) {
                for (
                    var s = i.mainAxis,
                        o = void 0 === s || s,
                        r = i.altAxis,
                        a = void 0 === r || r,
                        l = i.fallbackPlacements,
                        c = i.padding,
                        h = i.boundary,
                        d = i.rootBoundary,
                        u = i.altBoundary,
                        f = i.flipVariations,
                        p = void 0 === f || f,
                        m = i.allowedAutoPlacements,
                        g = e.options.placement,
                        _ = Ut(g),
                        b =
                            l ||
                            (_ !== g && p
                                ? (function (t) {
                                      if (Ut(t) === vt) return [];
                                      var e = ge(t);
                                      return [be(t), e, be(e)];
                                  })(g)
                                : [ge(g)]),
                        v = [g].concat(b).reduce(function (t, i) {
                            return t.concat(Ut(i) === vt ? Le(e, { placement: i, boundary: h, rootBoundary: d, padding: c, flipVariations: p, allowedAutoPlacements: m }) : i);
                        }, []),
                        y = e.rects.reference,
                        w = e.rects.popper,
                        E = new Map(),
                        A = !0,
                        T = v[0],
                        O = 0;
                    O < v.length;
                    O++
                ) {
                    var C = v[O],
                        k = Ut(C),
                        L = ce(C) === wt,
                        x = [mt, gt].indexOf(k) >= 0,
                        D = x ? "width" : "height",
                        S = ke(e, { placement: C, boundary: h, rootBoundary: d, altBoundary: u, padding: c }),
                        N = x ? (L ? _t : bt) : L ? gt : mt;
                    y[D] > w[D] && (N = ge(N));
                    var I = ge(N),
                        P = [];
                    if (
                        (o && P.push(S[k] <= 0),
                        a && P.push(S[N] <= 0, S[I] <= 0),
                        P.every(function (t) {
                            return t;
                        }))
                    ) {
                        (T = C), (A = !1);
                        break;
                    }
                    E.set(C, P);
                }
                if (A)
                    for (
                        var j = function (t) {
                                var e = v.find(function (e) {
                                    var i = E.get(e);
                                    if (i)
                                        return i.slice(0, t).every(function (t) {
                                            return t;
                                        });
                                });
                                if (e) return (T = e), "break";
                            },
                            M = p ? 3 : 1;
                        M > 0 && "break" !== j(M);
                        M--
                    );
                e.placement !== T && ((e.modifiersData[n]._skip = !0), (e.placement = T), (e.reset = !0));
            }
        },
        requiresIfExists: ["offset"],
        data: { _skip: !1 },
    };
    function De(t, e, i) {
        return void 0 === i && (i = { x: 0, y: 0 }), { top: t.top - e.height - i.y, right: t.right - e.width + i.x, bottom: t.bottom - e.height + i.y, left: t.left - e.width - i.x };
    }
    function Se(t) {
        return [mt, _t, gt, bt].some(function (e) {
            return t[e] >= 0;
        });
    }
    const Ne = {
            name: "hide",
            enabled: !0,
            phase: "main",
            requiresIfExists: ["preventOverflow"],
            fn: function (t) {
                var e = t.state,
                    i = t.name,
                    n = e.rects.reference,
                    s = e.rects.popper,
                    o = e.modifiersData.preventOverflow,
                    r = ke(e, { elementContext: "reference" }),
                    a = ke(e, { altBoundary: !0 }),
                    l = De(r, n),
                    c = De(a, s, o),
                    h = Se(l),
                    d = Se(c);
                (e.modifiersData[i] = { referenceClippingOffsets: l, popperEscapeOffsets: c, isReferenceHidden: h, hasPopperEscaped: d }),
                    (e.attributes.popper = Object.assign({}, e.attributes.popper, { "data-popper-reference-hidden": h, "data-popper-escaped": d }));
            },
        },
        Ie = {
            name: "offset",
            enabled: !0,
            phase: "main",
            requires: ["popperOffsets"],
            fn: function (t) {
                var e = t.state,
                    i = t.options,
                    n = t.name,
                    s = i.offset,
                    o = void 0 === s ? [0, 0] : s,
                    r = Lt.reduce(function (t, i) {
                        return (
                            (t[i] = (function (t, e, i) {
                                var n = Ut(t),
                                    s = [bt, mt].indexOf(n) >= 0 ? -1 : 1,
                                    o = "function" == typeof i ? i(Object.assign({}, e, { placement: t })) : i,
                                    r = o[0],
                                    a = o[1];
                                return (r = r || 0), (a = (a || 0) * s), [bt, _t].indexOf(n) >= 0 ? { x: a, y: r } : { x: r, y: a };
                            })(i, e.rects, o)),
                            t
                        );
                    }, {}),
                    a = r[e.placement],
                    l = a.x,
                    c = a.y;
                null != e.modifiersData.popperOffsets && ((e.modifiersData.popperOffsets.x += l), (e.modifiersData.popperOffsets.y += c)), (e.modifiersData[n] = r);
            },
        },
        Pe = {
            name: "popperOffsets",
            enabled: !0,
            phase: "read",
            fn: function (t) {
                var e = t.state,
                    i = t.name;
                e.modifiersData[i] = Ce({ reference: e.rects.reference, element: e.rects.popper, strategy: "absolute", placement: e.placement });
            },
            data: {},
        },
        je = {
            name: "preventOverflow",
            enabled: !0,
            phase: "main",
            fn: function (t) {
                var e = t.state,
                    i = t.options,
                    n = t.name,
                    s = i.mainAxis,
                    o = void 0 === s || s,
                    r = i.altAxis,
                    a = void 0 !== r && r,
                    l = i.boundary,
                    c = i.rootBoundary,
                    h = i.altBoundary,
                    d = i.padding,
                    u = i.tether,
                    f = void 0 === u || u,
                    p = i.tetherOffset,
                    m = void 0 === p ? 0 : p,
                    g = ke(e, { boundary: l, rootBoundary: c, padding: d, altBoundary: h }),
                    _ = Ut(e.placement),
                    b = ce(e.placement),
                    v = !b,
                    y = ee(_),
                    w = "x" === y ? "y" : "x",
                    E = e.modifiersData.popperOffsets,
                    A = e.rects.reference,
                    T = e.rects.popper,
                    O = "function" == typeof m ? m(Object.assign({}, e.rects, { placement: e.placement })) : m,
                    C = { x: 0, y: 0 };
                if (E) {
                    if (o || a) {
                        var k = "y" === y ? mt : bt,
                            L = "y" === y ? gt : _t,
                            x = "y" === y ? "height" : "width",
                            D = E[y],
                            S = E[y] + g[k],
                            N = E[y] - g[L],
                            I = f ? -T[x] / 2 : 0,
                            P = b === wt ? A[x] : T[x],
                            j = b === wt ? -T[x] : -A[x],
                            M = e.elements.arrow,
                            H = f && M ? Kt(M) : { width: 0, height: 0 },
                            B = e.modifiersData["arrow#persistent"] ? e.modifiersData["arrow#persistent"].padding : { top: 0, right: 0, bottom: 0, left: 0 },
                            R = B[k],
                            W = B[L],
                            $ = oe(0, A[x], H[x]),
                            z = v ? A[x] / 2 - I - $ - R - O : P - $ - R - O,
                            q = v ? -A[x] / 2 + I + $ + W + O : j + $ + W + O,
                            F = e.elements.arrow && te(e.elements.arrow),
                            U = F ? ("y" === y ? F.clientTop || 0 : F.clientLeft || 0) : 0,
                            V = e.modifiersData.offset ? e.modifiersData.offset[e.placement][y] : 0,
                            K = E[y] + z - V - U,
                            X = E[y] + q - V;
                        if (o) {
                            var Y = oe(f ? ne(S, K) : S, D, f ? ie(N, X) : N);
                            (E[y] = Y), (C[y] = Y - D);
                        }
                        if (a) {
                            var Q = "x" === y ? mt : bt,
                                G = "x" === y ? gt : _t,
                                Z = E[w],
                                J = Z + g[Q],
                                tt = Z - g[G],
                                et = oe(f ? ne(J, K) : J, Z, f ? ie(tt, X) : tt);
                            (E[w] = et), (C[w] = et - Z);
                        }
                    }
                    e.modifiersData[n] = C;
                }
            },
            requiresIfExists: ["offset"],
        };
    function Me(t, e, i) {
        void 0 === i && (i = !1);
        var n = zt(e);
        zt(e) &&
            (function (t) {
                var e = t.getBoundingClientRect();
                e.width, t.offsetWidth, e.height, t.offsetHeight;
            })(e);
        var s,
            o,
            r = Gt(e),
            a = Vt(t),
            l = { scrollLeft: 0, scrollTop: 0 },
            c = { x: 0, y: 0 };
        return (
            (n || (!n && !i)) &&
                (("body" !== Rt(e) || we(r)) && (l = (s = e) !== Wt(s) && zt(s) ? { scrollLeft: (o = s).scrollLeft, scrollTop: o.scrollTop } : ve(s)), zt(e) ? (((c = Vt(e)).x += e.clientLeft), (c.y += e.clientTop)) : r && (c.x = ye(r))),
            { x: a.left + l.scrollLeft - c.x, y: a.top + l.scrollTop - c.y, width: a.width, height: a.height }
        );
    }
    function He(t) {
        var e = new Map(),
            i = new Set(),
            n = [];
        function s(t) {
            i.add(t.name),
                [].concat(t.requires || [], t.requiresIfExists || []).forEach(function (t) {
                    if (!i.has(t)) {
                        var n = e.get(t);
                        n && s(n);
                    }
                }),
                n.push(t);
        }
        return (
            t.forEach(function (t) {
                e.set(t.name, t);
            }),
            t.forEach(function (t) {
                i.has(t.name) || s(t);
            }),
            n
        );
    }
    var Be = { placement: "bottom", modifiers: [], strategy: "absolute" };
    function Re() {
        for (var t = arguments.length, e = new Array(t), i = 0; i < t; i++) e[i] = arguments[i];
        return !e.some(function (t) {
            return !(t && "function" == typeof t.getBoundingClientRect);
        });
    }
    function We(t) {
        void 0 === t && (t = {});
        var e = t,
            i = e.defaultModifiers,
            n = void 0 === i ? [] : i,
            s = e.defaultOptions,
            o = void 0 === s ? Be : s;
        return function (t, e, i) {
            void 0 === i && (i = o);
            var s,
                r,
                a = { placement: "bottom", orderedModifiers: [], options: Object.assign({}, Be, o), modifiersData: {}, elements: { reference: t, popper: e }, attributes: {}, styles: {} },
                l = [],
                c = !1,
                h = {
                    state: a,
                    setOptions: function (i) {
                        var s = "function" == typeof i ? i(a.options) : i;
                        d(), (a.options = Object.assign({}, o, a.options, s)), (a.scrollParents = { reference: $t(t) ? Ae(t) : t.contextElement ? Ae(t.contextElement) : [], popper: Ae(e) });
                        var r,
                            c,
                            u = (function (t) {
                                var e = He(t);
                                return Bt.reduce(function (t, i) {
                                    return t.concat(
                                        e.filter(function (t) {
                                            return t.phase === i;
                                        })
                                    );
                                }, []);
                            })(
                                ((r = [].concat(n, a.options.modifiers)),
                                (c = r.reduce(function (t, e) {
                                    var i = t[e.name];
                                    return (t[e.name] = i ? Object.assign({}, i, e, { options: Object.assign({}, i.options, e.options), data: Object.assign({}, i.data, e.data) }) : e), t;
                                }, {})),
                                Object.keys(c).map(function (t) {
                                    return c[t];
                                }))
                            );
                        return (
                            (a.orderedModifiers = u.filter(function (t) {
                                return t.enabled;
                            })),
                            a.orderedModifiers.forEach(function (t) {
                                var e = t.name,
                                    i = t.options,
                                    n = void 0 === i ? {} : i,
                                    s = t.effect;
                                if ("function" == typeof s) {
                                    var o = s({ state: a, name: e, instance: h, options: n });
                                    l.push(o || function () {});
                                }
                            }),
                            h.update()
                        );
                    },
                    forceUpdate: function () {
                        if (!c) {
                            var t = a.elements,
                                e = t.reference,
                                i = t.popper;
                            if (Re(e, i)) {
                                (a.rects = { reference: Me(e, te(i), "fixed" === a.options.strategy), popper: Kt(i) }),
                                    (a.reset = !1),
                                    (a.placement = a.options.placement),
                                    a.orderedModifiers.forEach(function (t) {
                                        return (a.modifiersData[t.name] = Object.assign({}, t.data));
                                    });
                                for (var n = 0; n < a.orderedModifiers.length; n++)
                                    if (!0 !== a.reset) {
                                        var s = a.orderedModifiers[n],
                                            o = s.fn,
                                            r = s.options,
                                            l = void 0 === r ? {} : r,
                                            d = s.name;
                                        "function" == typeof o && (a = o({ state: a, options: l, name: d, instance: h }) || a);
                                    } else (a.reset = !1), (n = -1);
                            }
                        }
                    },
                    update:
                        ((s = function () {
                            return new Promise(function (t) {
                                h.forceUpdate(), t(a);
                            });
                        }),
                        function () {
                            return (
                                r ||
                                    (r = new Promise(function (t) {
                                        Promise.resolve().then(function () {
                                            (r = void 0), t(s());
                                        });
                                    })),
                                r
                            );
                        }),
                    destroy: function () {
                        d(), (c = !0);
                    },
                };
            if (!Re(t, e)) return h;
            function d() {
                l.forEach(function (t) {
                    return t();
                }),
                    (l = []);
            }
            return (
                h.setOptions(i).then(function (t) {
                    !c && i.onFirstUpdate && i.onFirstUpdate(t);
                }),
                h
            );
        };
    }
    var $e = We(),
        ze = We({ defaultModifiers: [pe, Pe, ue, Ft] }),
        qe = We({ defaultModifiers: [pe, Pe, ue, Ft, Ie, xe, je, le, Ne] });
    const Fe = Object.freeze({
            __proto__: null,
            popperGenerator: We,
            detectOverflow: ke,
            createPopperBase: $e,
            createPopper: qe,
            createPopperLite: ze,
            top: mt,
            bottom: gt,
            right: _t,
            left: bt,
            auto: vt,
            basePlacements: yt,
            start: wt,
            end: Et,
            clippingParents: At,
            viewport: Tt,
            popper: Ot,
            reference: Ct,
            variationPlacements: kt,
            placements: Lt,
            beforeRead: xt,
            read: Dt,
            afterRead: St,
            beforeMain: Nt,
            main: It,
            afterMain: Pt,
            beforeWrite: jt,
            write: Mt,
            afterWrite: Ht,
            modifierPhases: Bt,
            applyStyles: Ft,
            arrow: le,
            computeStyles: ue,
            eventListeners: pe,
            flip: xe,
            hide: Ne,
            offset: Ie,
            popperOffsets: Pe,
            preventOverflow: je,
        }),
        Ue = "dropdown",
        Ve = "Escape",
        Ke = "Space",
        Xe = "ArrowUp",
        Ye = "ArrowDown",
        Qe = new RegExp("ArrowUp|ArrowDown|Escape"),
        Ge = "click.bs.dropdown.data-api",
        Ze = "keydown.bs.dropdown.data-api",
        Je = "show",
        ti = '[data-bs-toggle="dropdown"]',
        ei = ".dropdown-menu",
        ii = m() ? "top-end" : "top-start",
        ni = m() ? "top-start" : "top-end",
        si = m() ? "bottom-end" : "bottom-start",
        oi = m() ? "bottom-start" : "bottom-end",
        ri = m() ? "left-start" : "right-start",
        ai = m() ? "right-start" : "left-start",
        li = { offset: [0, 2], boundary: "clippingParents", reference: "toggle", display: "dynamic", popperConfig: null, autoClose: !0 },
        ci = { offset: "(array|string|function)", boundary: "(string|element)", reference: "(string|element|object)", display: "string", popperConfig: "(null|object|function)", autoClose: "(boolean|string)" };
    class hi extends B {
        constructor(t, e) {
            super(t), (this._popper = null), (this._config = this._getConfig(e)), (this._menu = this._getMenuElement()), (this._inNavbar = this._detectNavbar());
        }
        static get Default() {
            return li;
        }
        static get DefaultType() {
            return ci;
        }
        static get NAME() {
            return Ue;
        }
        toggle() {
            return this._isShown() ? this.hide() : this.show();
        }
        show() {
            if (c(this._element) || this._isShown(this._menu)) return;
            const t = { relatedTarget: this._element };
            if (j.trigger(this._element, "show.bs.dropdown", t).defaultPrevented) return;
            const e = hi.getParentFromElement(this._element);
            this._inNavbar ? U.setDataAttribute(this._menu, "popper", "none") : this._createPopper(e),
                "ontouchstart" in document.documentElement && !e.closest(".navbar-nav") && [].concat(...document.body.children).forEach((t) => j.on(t, "mouseover", d)),
                this._element.focus(),
                this._element.setAttribute("aria-expanded", !0),
                this._menu.classList.add(Je),
                this._element.classList.add(Je),
                j.trigger(this._element, "shown.bs.dropdown", t);
        }
        hide() {
            if (c(this._element) || !this._isShown(this._menu)) return;
            const t = { relatedTarget: this._element };
            this._completeHide(t);
        }
        dispose() {
            this._popper && this._popper.destroy(), super.dispose();
        }
        update() {
            (this._inNavbar = this._detectNavbar()), this._popper && this._popper.update();
        }
        _completeHide(t) {
            j.trigger(this._element, "hide.bs.dropdown", t).defaultPrevented ||
                ("ontouchstart" in document.documentElement && [].concat(...document.body.children).forEach((t) => j.off(t, "mouseover", d)),
                this._popper && this._popper.destroy(),
                this._menu.classList.remove(Je),
                this._element.classList.remove(Je),
                this._element.setAttribute("aria-expanded", "false"),
                U.removeDataAttribute(this._menu, "popper"),
                j.trigger(this._element, "hidden.bs.dropdown", t));
        }
        _getConfig(t) {
            if (
                ((t = { ...this.constructor.Default, ...U.getDataAttributes(this._element), ...t }),
                a(Ue, t, this.constructor.DefaultType),
                "object" == typeof t.reference && !o(t.reference) && "function" != typeof t.reference.getBoundingClientRect)
            )
                throw new TypeError(`${Ue.toUpperCase()}: Option "reference" provided type "object" without a required "getBoundingClientRect" method.`);
            return t;
        }
        _createPopper(t) {
            if (void 0 === Fe) throw new TypeError("Bootstrap's dropdowns require Popper (https://popper.js.org)");
            let e = this._element;
            "parent" === this._config.reference ? (e = t) : o(this._config.reference) ? (e = r(this._config.reference)) : "object" == typeof this._config.reference && (e = this._config.reference);
            const i = this._getPopperConfig(),
                n = i.modifiers.find((t) => "applyStyles" === t.name && !1 === t.enabled);
            (this._popper = qe(e, this._menu, i)), n && U.setDataAttribute(this._menu, "popper", "static");
        }
        _isShown(t = this._element) {
            return t.classList.contains(Je);
        }
        _getMenuElement() {
            return V.next(this._element, ei)[0];
        }
        _getPlacement() {
            const t = this._element.parentNode;
            if (t.classList.contains("dropend")) return ri;
            if (t.classList.contains("dropstart")) return ai;
            const e = "end" === getComputedStyle(this._menu).getPropertyValue("--bs-position").trim();
            return t.classList.contains("dropup") ? (e ? ni : ii) : e ? oi : si;
        }
        _detectNavbar() {
            return null !== this._element.closest(".navbar");
        }
        _getOffset() {
            const { offset: t } = this._config;
            return "string" == typeof t ? t.split(",").map((t) => Number.parseInt(t, 10)) : "function" == typeof t ? (e) => t(e, this._element) : t;
        }
        _getPopperConfig() {
            const t = {
                placement: this._getPlacement(),
                modifiers: [
                    { name: "preventOverflow", options: { boundary: this._config.boundary } },
                    { name: "offset", options: { offset: this._getOffset() } },
                ],
            };
            return "static" === this._config.display && (t.modifiers = [{ name: "applyStyles", enabled: !1 }]), { ...t, ...("function" == typeof this._config.popperConfig ? this._config.popperConfig(t) : this._config.popperConfig) };
        }
        _selectMenuItem({ key: t, target: e }) {
            const i = V.find(".dropdown-menu .dropdown-item:not(.disabled):not(:disabled)", this._menu).filter(l);
            i.length && v(i, e, t === Ye, !i.includes(e)).focus();
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = hi.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t]();
                }
            });
        }
        static clearMenus(t) {
            if (t && (2 === t.button || ("keyup" === t.type && "Tab" !== t.key))) return;
            const e = V.find(ti);
            for (let i = 0, n = e.length; i < n; i++) {
                const n = hi.getInstance(e[i]);
                if (!n || !1 === n._config.autoClose) continue;
                if (!n._isShown()) continue;
                const s = { relatedTarget: n._element };
                if (t) {
                    const e = t.composedPath(),
                        i = e.includes(n._menu);
                    if (e.includes(n._element) || ("inside" === n._config.autoClose && !i) || ("outside" === n._config.autoClose && i)) continue;
                    if (n._menu.contains(t.target) && (("keyup" === t.type && "Tab" === t.key) || /input|select|option|textarea|form/i.test(t.target.tagName))) continue;
                    "click" === t.type && (s.clickEvent = t);
                }
                n._completeHide(s);
            }
        }
        static getParentFromElement(t) {
            return n(t) || t.parentNode;
        }
        static dataApiKeydownHandler(t) {
            if (/input|textarea/i.test(t.target.tagName) ? t.key === Ke || (t.key !== Ve && ((t.key !== Ye && t.key !== Xe) || t.target.closest(ei))) : !Qe.test(t.key)) return;
            const e = this.classList.contains(Je);
            if (!e && t.key === Ve) return;
            if ((t.preventDefault(), t.stopPropagation(), c(this))) return;
            const i = this.matches(ti) ? this : V.prev(this, ti)[0],
                n = hi.getOrCreateInstance(i);
            if (t.key !== Ve) return t.key === Xe || t.key === Ye ? (e || n.show(), void n._selectMenuItem(t)) : void ((e && t.key !== Ke) || hi.clearMenus());
            n.hide();
        }
    }
    j.on(document, Ze, ti, hi.dataApiKeydownHandler),
        j.on(document, Ze, ei, hi.dataApiKeydownHandler),
        j.on(document, Ge, hi.clearMenus),
        j.on(document, "keyup.bs.dropdown.data-api", hi.clearMenus),
        j.on(document, Ge, ti, function (t) {
            t.preventDefault(), hi.getOrCreateInstance(this).toggle();
        }),
        g(hi);
    const di = ".fixed-top, .fixed-bottom, .is-fixed, .sticky-top",
        ui = ".sticky-top";
    class fi {
        constructor() {
            this._element = document.body;
        }
        getWidth() {
            const t = document.documentElement.clientWidth;
            return Math.abs(window.innerWidth - t);
        }
        hide() {
            const t = this.getWidth();
            this._disableOverFlow(), this._setElementAttributes(this._element, "paddingRight", (e) => e + t), this._setElementAttributes(di, "paddingRight", (e) => e + t), this._setElementAttributes(ui, "marginRight", (e) => e - t);
        }
        _disableOverFlow() {
            this._saveInitialAttribute(this._element, "overflow"), (this._element.style.overflow = "hidden");
        }
        _setElementAttributes(t, e, i) {
            const n = this.getWidth();
            this._applyManipulationCallback(t, (t) => {
                if (t !== this._element && window.innerWidth > t.clientWidth + n) return;
                this._saveInitialAttribute(t, e);
                const s = window.getComputedStyle(t)[e];
                t.style[e] = `${i(Number.parseFloat(s))}px`;
            });
        }
        reset() {
            this._resetElementAttributes(this._element, "overflow"), this._resetElementAttributes(this._element, "paddingRight"), this._resetElementAttributes(di, "paddingRight"), this._resetElementAttributes(ui, "marginRight");
        }
        _saveInitialAttribute(t, e) {
            const i = t.style[e];
            i && U.setDataAttribute(t, e, i);
        }
        _resetElementAttributes(t, e) {
            this._applyManipulationCallback(t, (t) => {
                const i = U.getDataAttribute(t, e);
                void 0 === i ? t.style.removeProperty(e) : (U.removeDataAttribute(t, e), (t.style[e] = i));
            });
        }
        _applyManipulationCallback(t, e) {
            o(t) ? e(t) : V.find(t, this._element).forEach(e);
        }
        isOverflowing() {
            return this.getWidth() > 0;
        }
    }
    const pi = { className: "modal-backdrop", isVisible: !0, isAnimated: !1, rootElement: "body", clickCallback: null },
        mi = { className: "string", isVisible: "boolean", isAnimated: "boolean", rootElement: "(element|string)", clickCallback: "(function|null)" },
        gi = "show",
        _i = "mousedown.bs.backdrop";
    class bi {
        constructor(t) {
            (this._config = this._getConfig(t)), (this._isAppended = !1), (this._element = null);
        }
        show(t) {
            this._config.isVisible
                ? (this._append(),
                  this._config.isAnimated && u(this._getElement()),
                  this._getElement().classList.add(gi),
                  this._emulateAnimation(() => {
                      _(t);
                  }))
                : _(t);
        }
        hide(t) {
            this._config.isVisible
                ? (this._getElement().classList.remove(gi),
                  this._emulateAnimation(() => {
                      this.dispose(), _(t);
                  }))
                : _(t);
        }
        _getElement() {
            if (!this._element) {
                const t = document.createElement("div");
                (t.className = this._config.className), this._config.isAnimated && t.classList.add("fade"), (this._element = t);
            }
            return this._element;
        }
        _getConfig(t) {
            return ((t = { ...pi, ...("object" == typeof t ? t : {}) }).rootElement = r(t.rootElement)), a("backdrop", t, mi), t;
        }
        _append() {
            this._isAppended ||
                (this._config.rootElement.append(this._getElement()),
                j.on(this._getElement(), _i, () => {
                    _(this._config.clickCallback);
                }),
                (this._isAppended = !0));
        }
        dispose() {
            this._isAppended && (j.off(this._element, _i), this._element.remove(), (this._isAppended = !1));
        }
        _emulateAnimation(t) {
            b(t, this._getElement(), this._config.isAnimated);
        }
    }
    const vi = { trapElement: null, autofocus: !0 },
        yi = { trapElement: "element", autofocus: "boolean" },
        wi = ".bs.focustrap",
        Ei = "backward";
    class Ai {
        constructor(t) {
            (this._config = this._getConfig(t)), (this._isActive = !1), (this._lastTabNavDirection = null);
        }
        activate() {
            const { trapElement: t, autofocus: e } = this._config;
            this._isActive || (e && t.focus(), j.off(document, wi), j.on(document, "focusin.bs.focustrap", (t) => this._handleFocusin(t)), j.on(document, "keydown.tab.bs.focustrap", (t) => this._handleKeydown(t)), (this._isActive = !0));
        }
        deactivate() {
            this._isActive && ((this._isActive = !1), j.off(document, wi));
        }
        _handleFocusin(t) {
            const { target: e } = t,
                { trapElement: i } = this._config;
            if (e === document || e === i || i.contains(e)) return;
            const n = V.focusableChildren(i);
            0 === n.length ? i.focus() : this._lastTabNavDirection === Ei ? n[n.length - 1].focus() : n[0].focus();
        }
        _handleKeydown(t) {
            "Tab" === t.key && (this._lastTabNavDirection = t.shiftKey ? Ei : "forward");
        }
        _getConfig(t) {
            return (t = { ...vi, ...("object" == typeof t ? t : {}) }), a("focustrap", t, yi), t;
        }
    }
    const Ti = "modal",
        Oi = "Escape",
        Ci = { backdrop: !0, keyboard: !0, focus: !0 },
        ki = { backdrop: "(boolean|string)", keyboard: "boolean", focus: "boolean" },
        Li = "hidden.bs.modal",
        xi = "show.bs.modal",
        Di = "resize.bs.modal",
        Si = "click.dismiss.bs.modal",
        Ni = "keydown.dismiss.bs.modal",
        Ii = "mousedown.dismiss.bs.modal",
        Pi = "modal-open",
        ji = "show",
        Mi = "modal-static";
    class Hi extends B {
        constructor(t, e) {
            super(t),
                (this._config = this._getConfig(e)),
                (this._dialog = V.findOne(".modal-dialog", this._element)),
                (this._backdrop = this._initializeBackDrop()),
                (this._focustrap = this._initializeFocusTrap()),
                (this._isShown = !1),
                (this._ignoreBackdropClick = !1),
                (this._isTransitioning = !1),
                (this._scrollBar = new fi());
        }
        static get Default() {
            return Ci;
        }
        static get NAME() {
            return Ti;
        }
        toggle(t) {
            return this._isShown ? this.hide() : this.show(t);
        }
        show(t) {
            this._isShown ||
                this._isTransitioning ||
                j.trigger(this._element, xi, { relatedTarget: t }).defaultPrevented ||
                ((this._isShown = !0),
                this._isAnimated() && (this._isTransitioning = !0),
                this._scrollBar.hide(),
                document.body.classList.add(Pi),
                this._adjustDialog(),
                this._setEscapeEvent(),
                this._setResizeEvent(),
                j.on(this._dialog, Ii, () => {
                    j.one(this._element, "mouseup.dismiss.bs.modal", (t) => {
                        t.target === this._element && (this._ignoreBackdropClick = !0);
                    });
                }),
                this._showBackdrop(() => this._showElement(t)));
        }
        hide() {
            if (!this._isShown || this._isTransitioning) return;
            if (j.trigger(this._element, "hide.bs.modal").defaultPrevented) return;
            this._isShown = !1;
            const t = this._isAnimated();
            t && (this._isTransitioning = !0),
                this._setEscapeEvent(),
                this._setResizeEvent(),
                this._focustrap.deactivate(),
                this._element.classList.remove(ji),
                j.off(this._element, Si),
                j.off(this._dialog, Ii),
                this._queueCallback(() => this._hideModal(), this._element, t);
        }
        dispose() {
            [window, this._dialog].forEach((t) => j.off(t, ".bs.modal")), this._backdrop.dispose(), this._focustrap.deactivate(), super.dispose();
        }
        handleUpdate() {
            this._adjustDialog();
        }
        _initializeBackDrop() {
            return new bi({ isVisible: Boolean(this._config.backdrop), isAnimated: this._isAnimated() });
        }
        _initializeFocusTrap() {
            return new Ai({ trapElement: this._element });
        }
        _getConfig(t) {
            return (t = { ...Ci, ...U.getDataAttributes(this._element), ...("object" == typeof t ? t : {}) }), a(Ti, t, ki), t;
        }
        _showElement(t) {
            const e = this._isAnimated(),
                i = V.findOne(".modal-body", this._dialog);
            (this._element.parentNode && this._element.parentNode.nodeType === Node.ELEMENT_NODE) || document.body.append(this._element),
                (this._element.style.display = "block"),
                this._element.removeAttribute("aria-hidden"),
                this._element.setAttribute("aria-modal", !0),
                this._element.setAttribute("role", "dialog"),
                (this._element.scrollTop = 0),
                i && (i.scrollTop = 0),
                e && u(this._element),
                this._element.classList.add(ji),
                this._queueCallback(
                    () => {
                        this._config.focus && this._focustrap.activate(), (this._isTransitioning = !1), j.trigger(this._element, "shown.bs.modal", { relatedTarget: t });
                    },
                    this._dialog,
                    e
                );
        }
        _setEscapeEvent() {
            this._isShown
                ? j.on(this._element, Ni, (t) => {
                      this._config.keyboard && t.key === Oi ? (t.preventDefault(), this.hide()) : this._config.keyboard || t.key !== Oi || this._triggerBackdropTransition();
                  })
                : j.off(this._element, Ni);
        }
        _setResizeEvent() {
            this._isShown ? j.on(window, Di, () => this._adjustDialog()) : j.off(window, Di);
        }
        _hideModal() {
            (this._element.style.display = "none"),
                this._element.setAttribute("aria-hidden", !0),
                this._element.removeAttribute("aria-modal"),
                this._element.removeAttribute("role"),
                (this._isTransitioning = !1),
                this._backdrop.hide(() => {
                    document.body.classList.remove(Pi), this._resetAdjustments(), this._scrollBar.reset(), j.trigger(this._element, Li);
                });
        }
        _showBackdrop(t) {
            j.on(this._element, Si, (t) => {
                this._ignoreBackdropClick ? (this._ignoreBackdropClick = !1) : t.target === t.currentTarget && (!0 === this._config.backdrop ? this.hide() : "static" === this._config.backdrop && this._triggerBackdropTransition());
            }),
                this._backdrop.show(t);
        }
        _isAnimated() {
            return this._element.classList.contains("fade");
        }
        _triggerBackdropTransition() {
            if (j.trigger(this._element, "hidePrevented.bs.modal").defaultPrevented) return;
            const { classList: t, scrollHeight: e, style: i } = this._element,
                n = e > document.documentElement.clientHeight;
            (!n && "hidden" === i.overflowY) ||
                t.contains(Mi) ||
                (n || (i.overflowY = "hidden"),
                t.add(Mi),
                this._queueCallback(() => {
                    t.remove(Mi),
                        n ||
                            this._queueCallback(() => {
                                i.overflowY = "";
                            }, this._dialog);
                }, this._dialog),
                this._element.focus());
        }
        _adjustDialog() {
            const t = this._element.scrollHeight > document.documentElement.clientHeight,
                e = this._scrollBar.getWidth(),
                i = e > 0;
            ((!i && t && !m()) || (i && !t && m())) && (this._element.style.paddingLeft = `${e}px`), ((i && !t && !m()) || (!i && t && m())) && (this._element.style.paddingRight = `${e}px`);
        }
        _resetAdjustments() {
            (this._element.style.paddingLeft = ""), (this._element.style.paddingRight = "");
        }
        static jQueryInterface(t, e) {
            return this.each(function () {
                const i = Hi.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === i[t]) throw new TypeError(`No method named "${t}"`);
                    i[t](e);
                }
            });
        }
    }
    j.on(document, "click.bs.modal.data-api", '[data-bs-toggle="modal"]', function (t) {
        const e = n(this);
        ["A", "AREA"].includes(this.tagName) && t.preventDefault(),
            j.one(e, xi, (t) => {
                t.defaultPrevented ||
                    j.one(e, Li, () => {
                        l(this) && this.focus();
                    });
            });
        const i = V.findOne(".modal.show");
        i && Hi.getInstance(i).hide(), Hi.getOrCreateInstance(e).toggle(this);
    }),
        R(Hi),
        g(Hi);
    const Bi = "offcanvas",
        Ri = { backdrop: !0, keyboard: !0, scroll: !1 },
        Wi = { backdrop: "boolean", keyboard: "boolean", scroll: "boolean" },
        $i = "show",
        zi = ".offcanvas.show",
        qi = "hidden.bs.offcanvas";
    class Fi extends B {
        constructor(t, e) {
            super(t), (this._config = this._getConfig(e)), (this._isShown = !1), (this._backdrop = this._initializeBackDrop()), (this._focustrap = this._initializeFocusTrap()), this._addEventListeners();
        }
        static get NAME() {
            return Bi;
        }
        static get Default() {
            return Ri;
        }
        toggle(t) {
            return this._isShown ? this.hide() : this.show(t);
        }
        show(t) {
            this._isShown ||
                j.trigger(this._element, "show.bs.offcanvas", { relatedTarget: t }).defaultPrevented ||
                ((this._isShown = !0),
                (this._element.style.visibility = "visible"),
                this._backdrop.show(),
                this._config.scroll || new fi().hide(),
                this._element.removeAttribute("aria-hidden"),
                this._element.setAttribute("aria-modal", !0),
                this._element.setAttribute("role", "dialog"),
                this._element.classList.add($i),
                this._queueCallback(
                    () => {
                        this._config.scroll || this._focustrap.activate(), j.trigger(this._element, "shown.bs.offcanvas", { relatedTarget: t });
                    },
                    this._element,
                    !0
                ));
        }
        hide() {
            this._isShown &&
                (j.trigger(this._element, "hide.bs.offcanvas").defaultPrevented ||
                    (this._focustrap.deactivate(),
                    this._element.blur(),
                    (this._isShown = !1),
                    this._element.classList.remove($i),
                    this._backdrop.hide(),
                    this._queueCallback(
                        () => {
                            this._element.setAttribute("aria-hidden", !0),
                                this._element.removeAttribute("aria-modal"),
                                this._element.removeAttribute("role"),
                                (this._element.style.visibility = "hidden"),
                                this._config.scroll || new fi().reset(),
                                j.trigger(this._element, qi);
                        },
                        this._element,
                        !0
                    )));
        }
        dispose() {
            this._backdrop.dispose(), this._focustrap.deactivate(), super.dispose();
        }
        _getConfig(t) {
            return (t = { ...Ri, ...U.getDataAttributes(this._element), ...("object" == typeof t ? t : {}) }), a(Bi, t, Wi), t;
        }
        _initializeBackDrop() {
            return new bi({ className: "offcanvas-backdrop", isVisible: this._config.backdrop, isAnimated: !0, rootElement: this._element.parentNode, clickCallback: () => this.hide() });
        }
        _initializeFocusTrap() {
            return new Ai({ trapElement: this._element });
        }
        _addEventListeners() {
            j.on(this._element, "keydown.dismiss.bs.offcanvas", (t) => {
                this._config.keyboard && "Escape" === t.key && this.hide();
            });
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = Fi.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t] || t.startsWith("_") || "constructor" === t) throw new TypeError(`No method named "${t}"`);
                    e[t](this);
                }
            });
        }
    }
    j.on(document, "click.bs.offcanvas.data-api", '[data-bs-toggle="offcanvas"]', function (t) {
        const e = n(this);
        if ((["A", "AREA"].includes(this.tagName) && t.preventDefault(), c(this))) return;
        j.one(e, qi, () => {
            l(this) && this.focus();
        });
        const i = V.findOne(zi);
        i && i !== e && Fi.getInstance(i).hide(), Fi.getOrCreateInstance(e).toggle(this);
    }),
        j.on(window, "load.bs.offcanvas.data-api", () => V.find(zi).forEach((t) => Fi.getOrCreateInstance(t).show())),
        R(Fi),
        g(Fi);
    const Ui = new Set(["background", "cite", "href", "itemtype", "longdesc", "poster", "src", "xlink:href"]),
        Vi = /^(?:(?:https?|mailto|ftp|tel|file|sms):|[^#&/:?]*(?:[#/?]|$))/i,
        Ki = /^data:(?:image\/(?:bmp|gif|jpeg|jpg|png|tiff|webp)|video\/(?:mpeg|mp4|ogg|webm)|audio\/(?:mp3|oga|ogg|opus));base64,[\d+/a-z]+=*$/i,
        Xi = (t, e) => {
            const i = t.nodeName.toLowerCase();
            if (e.includes(i)) return !Ui.has(i) || Boolean(Vi.test(t.nodeValue) || Ki.test(t.nodeValue));
            const n = e.filter((t) => t instanceof RegExp);
            for (let t = 0, e = n.length; t < e; t++) if (n[t].test(i)) return !0;
            return !1;
        };
    function Yi(t, e, i) {
        if (!t.length) return t;
        if (i && "function" == typeof i) return i(t);
        const n = new window.DOMParser().parseFromString(t, "text/html"),
            s = [].concat(...n.body.querySelectorAll("*"));
        for (let t = 0, i = s.length; t < i; t++) {
            const i = s[t],
                n = i.nodeName.toLowerCase();
            if (!Object.keys(e).includes(n)) {
                i.remove();
                continue;
            }
            const o = [].concat(...i.attributes),
                r = [].concat(e["*"] || [], e[n] || []);
            o.forEach((t) => {
                Xi(t, r) || i.removeAttribute(t.nodeName);
            });
        }
        return n.body.innerHTML;
    }
    const Qi = "tooltip",
        Gi = new Set(["sanitize", "allowList", "sanitizeFn"]),
        Zi = {
            animation: "boolean",
            template: "string",
            title: "(string|element|function)",
            trigger: "string",
            delay: "(number|object)",
            html: "boolean",
            selector: "(string|boolean)",
            placement: "(string|function)",
            offset: "(array|string|function)",
            container: "(string|element|boolean)",
            fallbackPlacements: "array",
            boundary: "(string|element)",
            customClass: "(string|function)",
            sanitize: "boolean",
            sanitizeFn: "(null|function)",
            allowList: "object",
            popperConfig: "(null|object|function)",
        },
        Ji = { AUTO: "auto", TOP: "top", RIGHT: m() ? "left" : "right", BOTTOM: "bottom", LEFT: m() ? "right" : "left" },
        tn = {
            animation: !0,
            template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',
            trigger: "hover focus",
            title: "",
            delay: 0,
            html: !1,
            selector: !1,
            placement: "top",
            offset: [0, 0],
            container: !1,
            fallbackPlacements: ["top", "right", "bottom", "left"],
            boundary: "clippingParents",
            customClass: "",
            sanitize: !0,
            sanitizeFn: null,
            allowList: {
                "*": ["class", "dir", "id", "lang", "role", /^aria-[\w-]*$/i],
                a: ["target", "href", "title", "rel"],
                area: [],
                b: [],
                br: [],
                col: [],
                code: [],
                div: [],
                em: [],
                hr: [],
                h1: [],
                h2: [],
                h3: [],
                h4: [],
                h5: [],
                h6: [],
                i: [],
                img: ["src", "srcset", "alt", "title", "width", "height"],
                li: [],
                ol: [],
                p: [],
                pre: [],
                s: [],
                small: [],
                span: [],
                sub: [],
                sup: [],
                strong: [],
                u: [],
                ul: [],
            },
            popperConfig: null,
        },
        en = {
            HIDE: "hide.bs.tooltip",
            HIDDEN: "hidden.bs.tooltip",
            SHOW: "show.bs.tooltip",
            SHOWN: "shown.bs.tooltip",
            INSERTED: "inserted.bs.tooltip",
            CLICK: "click.bs.tooltip",
            FOCUSIN: "focusin.bs.tooltip",
            FOCUSOUT: "focusout.bs.tooltip",
            MOUSEENTER: "mouseenter.bs.tooltip",
            MOUSELEAVE: "mouseleave.bs.tooltip",
        },
        nn = "fade",
        sn = "show",
        on = "show",
        rn = "out",
        an = ".tooltip-inner",
        ln = ".modal",
        cn = "hide.bs.modal",
        hn = "hover",
        dn = "focus";
    class un extends B {
        constructor(t, e) {
            if (void 0 === Fe) throw new TypeError("Bootstrap's tooltips require Popper (https://popper.js.org)");
            super(t), (this._isEnabled = !0), (this._timeout = 0), (this._hoverState = ""), (this._activeTrigger = {}), (this._popper = null), (this._config = this._getConfig(e)), (this.tip = null), this._setListeners();
        }
        static get Default() {
            return tn;
        }
        static get NAME() {
            return Qi;
        }
        static get Event() {
            return en;
        }
        static get DefaultType() {
            return Zi;
        }
        enable() {
            this._isEnabled = !0;
        }
        disable() {
            this._isEnabled = !1;
        }
        toggleEnabled() {
            this._isEnabled = !this._isEnabled;
        }
        toggle(t) {
            if (this._isEnabled)
                if (t) {
                    const e = this._initializeOnDelegatedTarget(t);
                    (e._activeTrigger.click = !e._activeTrigger.click), e._isWithActiveTrigger() ? e._enter(null, e) : e._leave(null, e);
                } else {
                    if (this.getTipElement().classList.contains(sn)) return void this._leave(null, this);
                    this._enter(null, this);
                }
        }
        dispose() {
            clearTimeout(this._timeout), j.off(this._element.closest(ln), cn, this._hideModalHandler), this.tip && this.tip.remove(), this._disposePopper(), super.dispose();
        }
        show() {
            if ("none" === this._element.style.display) throw new Error("Please use show on visible elements");
            if (!this.isWithContent() || !this._isEnabled) return;
            const t = j.trigger(this._element, this.constructor.Event.SHOW),
                e = h(this._element),
                i = null === e ? this._element.ownerDocument.documentElement.contains(this._element) : e.contains(this._element);
            if (t.defaultPrevented || !i) return;
            "tooltip" === this.constructor.NAME && this.tip && this.getTitle() !== this.tip.querySelector(an).innerHTML && (this._disposePopper(), this.tip.remove(), (this.tip = null));
            const n = this.getTipElement(),
                s = ((t) => {
                    do {
                        t += Math.floor(1e6 * Math.random());
                    } while (document.getElementById(t));
                    return t;
                })(this.constructor.NAME);
            n.setAttribute("id", s), this._element.setAttribute("aria-describedby", s), this._config.animation && n.classList.add(nn);
            const o = "function" == typeof this._config.placement ? this._config.placement.call(this, n, this._element) : this._config.placement,
                r = this._getAttachment(o);
            this._addAttachmentClass(r);
            const { container: a } = this._config;
            H.set(n, this.constructor.DATA_KEY, this),
                this._element.ownerDocument.documentElement.contains(this.tip) || (a.append(n), j.trigger(this._element, this.constructor.Event.INSERTED)),
                this._popper ? this._popper.update() : (this._popper = qe(this._element, n, this._getPopperConfig(r))),
                n.classList.add(sn);
            const l = this._resolvePossibleFunction(this._config.customClass);
            l && n.classList.add(...l.split(" ")),
                "ontouchstart" in document.documentElement &&
                    [].concat(...document.body.children).forEach((t) => {
                        j.on(t, "mouseover", d);
                    });
            const c = this.tip.classList.contains(nn);
            this._queueCallback(
                () => {
                    const t = this._hoverState;
                    (this._hoverState = null), j.trigger(this._element, this.constructor.Event.SHOWN), t === rn && this._leave(null, this);
                },
                this.tip,
                c
            );
        }
        hide() {
            if (!this._popper) return;
            const t = this.getTipElement();
            if (j.trigger(this._element, this.constructor.Event.HIDE).defaultPrevented) return;
            t.classList.remove(sn),
                "ontouchstart" in document.documentElement && [].concat(...document.body.children).forEach((t) => j.off(t, "mouseover", d)),
                (this._activeTrigger.click = !1),
                (this._activeTrigger.focus = !1),
                (this._activeTrigger.hover = !1);
            const e = this.tip.classList.contains(nn);
            this._queueCallback(
                () => {
                    this._isWithActiveTrigger() ||
                        (this._hoverState !== on && t.remove(), this._cleanTipClass(), this._element.removeAttribute("aria-describedby"), j.trigger(this._element, this.constructor.Event.HIDDEN), this._disposePopper());
                },
                this.tip,
                e
            ),
                (this._hoverState = "");
        }
        update() {
            null !== this._popper && this._popper.update();
        }
        isWithContent() {
            return Boolean(this.getTitle());
        }
        getTipElement() {
            if (this.tip) return this.tip;
            const t = document.createElement("div");
            t.innerHTML = this._config.template;
            const e = t.children[0];
            return this.setContent(e), e.classList.remove(nn, sn), (this.tip = e), this.tip;
        }
        setContent(t) {
            this._sanitizeAndSetContent(t, this.getTitle(), an);
        }
        _sanitizeAndSetContent(t, e, i) {
            const n = V.findOne(i, t);
            e || !n ? this.setElementContent(n, e) : n.remove();
        }
        setElementContent(t, e) {
            if (null !== t)
                return o(e)
                    ? ((e = r(e)), void (this._config.html ? e.parentNode !== t && ((t.innerHTML = ""), t.append(e)) : (t.textContent = e.textContent)))
                    : void (this._config.html ? (this._config.sanitize && (e = Yi(e, this._config.allowList, this._config.sanitizeFn)), (t.innerHTML = e)) : (t.textContent = e));
        }
        getTitle() {
            const t = this._element.getAttribute("data-bs-original-title") || this._config.title;
            return this._resolvePossibleFunction(t);
        }
        updateAttachment(t) {
            return "right" === t ? "end" : "left" === t ? "start" : t;
        }
        _initializeOnDelegatedTarget(t, e) {
            return e || this.constructor.getOrCreateInstance(t.delegateTarget, this._getDelegateConfig());
        }
        _getOffset() {
            const { offset: t } = this._config;
            return "string" == typeof t ? t.split(",").map((t) => Number.parseInt(t, 10)) : "function" == typeof t ? (e) => t(e, this._element) : t;
        }
        _resolvePossibleFunction(t) {
            return "function" == typeof t ? t.call(this._element) : t;
        }
        _getPopperConfig(t) {
            const e = {
                placement: t,
                modifiers: [
                    { name: "flip", options: { fallbackPlacements: this._config.fallbackPlacements } },
                    { name: "offset", options: { offset: this._getOffset() } },
                    { name: "preventOverflow", options: { boundary: this._config.boundary } },
                    { name: "arrow", options: { element: `.${this.constructor.NAME}-arrow` } },
                    { name: "onChange", enabled: !0, phase: "afterWrite", fn: (t) => this._handlePopperPlacementChange(t) },
                ],
                onFirstUpdate: (t) => {
                    t.options.placement !== t.placement && this._handlePopperPlacementChange(t);
                },
            };
            return { ...e, ...("function" == typeof this._config.popperConfig ? this._config.popperConfig(e) : this._config.popperConfig) };
        }
        _addAttachmentClass(t) {
            this.getTipElement().classList.add(`${this._getBasicClassPrefix()}-${this.updateAttachment(t)}`);
        }
        _getAttachment(t) {
            return Ji[t.toUpperCase()];
        }
        _setListeners() {
            this._config.trigger.split(" ").forEach((t) => {
                if ("click" === t) j.on(this._element, this.constructor.Event.CLICK, this._config.selector, (t) => this.toggle(t));
                else if ("manual" !== t) {
                    const e = t === hn ? this.constructor.Event.MOUSEENTER : this.constructor.Event.FOCUSIN,
                        i = t === hn ? this.constructor.Event.MOUSELEAVE : this.constructor.Event.FOCUSOUT;
                    j.on(this._element, e, this._config.selector, (t) => this._enter(t)), j.on(this._element, i, this._config.selector, (t) => this._leave(t));
                }
            }),
                (this._hideModalHandler = () => {
                    this._element && this.hide();
                }),
                j.on(this._element.closest(ln), cn, this._hideModalHandler),
                this._config.selector ? (this._config = { ...this._config, trigger: "manual", selector: "" }) : this._fixTitle();
        }
        _fixTitle() {
            const t = this._element.getAttribute("title"),
                e = typeof this._element.getAttribute("data-bs-original-title");
            (t || "string" !== e) &&
                (this._element.setAttribute("data-bs-original-title", t || ""),
                !t || this._element.getAttribute("aria-label") || this._element.textContent || this._element.setAttribute("aria-label", t),
                this._element.setAttribute("title", ""));
        }
        _enter(t, e) {
            (e = this._initializeOnDelegatedTarget(t, e)),
                t && (e._activeTrigger["focusin" === t.type ? dn : hn] = !0),
                e.getTipElement().classList.contains(sn) || e._hoverState === on
                    ? (e._hoverState = on)
                    : (clearTimeout(e._timeout),
                      (e._hoverState = on),
                      e._config.delay && e._config.delay.show
                          ? (e._timeout = setTimeout(() => {
                                e._hoverState === on && e.show();
                            }, e._config.delay.show))
                          : e.show());
        }
        _leave(t, e) {
            (e = this._initializeOnDelegatedTarget(t, e)),
                t && (e._activeTrigger["focusout" === t.type ? dn : hn] = e._element.contains(t.relatedTarget)),
                e._isWithActiveTrigger() ||
                    (clearTimeout(e._timeout),
                    (e._hoverState = rn),
                    e._config.delay && e._config.delay.hide
                        ? (e._timeout = setTimeout(() => {
                              e._hoverState === rn && e.hide();
                          }, e._config.delay.hide))
                        : e.hide());
        }
        _isWithActiveTrigger() {
            for (const t in this._activeTrigger) if (this._activeTrigger[t]) return !0;
            return !1;
        }
        _getConfig(t) {
            const e = U.getDataAttributes(this._element);
            return (
                Object.keys(e).forEach((t) => {
                    Gi.has(t) && delete e[t];
                }),
                ((t = { ...this.constructor.Default, ...e, ...("object" == typeof t && t ? t : {}) }).container = !1 === t.container ? document.body : r(t.container)),
                "number" == typeof t.delay && (t.delay = { show: t.delay, hide: t.delay }),
                "number" == typeof t.title && (t.title = t.title.toString()),
                "number" == typeof t.content && (t.content = t.content.toString()),
                a(Qi, t, this.constructor.DefaultType),
                t.sanitize && (t.template = Yi(t.template, t.allowList, t.sanitizeFn)),
                t
            );
        }
        _getDelegateConfig() {
            const t = {};
            for (const e in this._config) this.constructor.Default[e] !== this._config[e] && (t[e] = this._config[e]);
            return t;
        }
        _cleanTipClass() {
            const t = this.getTipElement(),
                e = new RegExp(`(^|\\s)${this._getBasicClassPrefix()}\\S+`, "g"),
                i = t.getAttribute("class").match(e);
            null !== i && i.length > 0 && i.map((t) => t.trim()).forEach((e) => t.classList.remove(e));
        }
        _getBasicClassPrefix() {
            return "bs-tooltip";
        }
        _handlePopperPlacementChange(t) {
            const { state: e } = t;
            e && ((this.tip = e.elements.popper), this._cleanTipClass(), this._addAttachmentClass(this._getAttachment(e.placement)));
        }
        _disposePopper() {
            this._popper && (this._popper.destroy(), (this._popper = null));
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = un.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t]();
                }
            });
        }
    }
    g(un);
    const fn = {
            ...un.Default,
            placement: "right",
            offset: [0, 8],
            trigger: "click",
            content: "",
            template: '<div class="popover" role="tooltip"><div class="popover-arrow"></div><h3 class="popover-header"></h3><div class="popover-body"></div></div>',
        },
        pn = { ...un.DefaultType, content: "(string|element|function)" },
        mn = {
            HIDE: "hide.bs.popover",
            HIDDEN: "hidden.bs.popover",
            SHOW: "show.bs.popover",
            SHOWN: "shown.bs.popover",
            INSERTED: "inserted.bs.popover",
            CLICK: "click.bs.popover",
            FOCUSIN: "focusin.bs.popover",
            FOCUSOUT: "focusout.bs.popover",
            MOUSEENTER: "mouseenter.bs.popover",
            MOUSELEAVE: "mouseleave.bs.popover",
        };
    class gn extends un {
        static get Default() {
            return fn;
        }
        static get NAME() {
            return "popover";
        }
        static get Event() {
            return mn;
        }
        static get DefaultType() {
            return pn;
        }
        isWithContent() {
            return this.getTitle() || this._getContent();
        }
        setContent(t) {
            this._sanitizeAndSetContent(t, this.getTitle(), ".popover-header"), this._sanitizeAndSetContent(t, this._getContent(), ".popover-body");
        }
        _getContent() {
            return this._resolvePossibleFunction(this._config.content);
        }
        _getBasicClassPrefix() {
            return "bs-popover";
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = gn.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t]();
                }
            });
        }
    }
    g(gn);
    const _n = "scrollspy",
        bn = { offset: 10, method: "auto", target: "" },
        vn = { offset: "number", method: "string", target: "(string|element)" },
        yn = "active",
        wn = ".nav-link, .list-group-item, .dropdown-item",
        En = "position";
    class An extends B {
        constructor(t, e) {
            super(t),
                (this._scrollElement = "BODY" === this._element.tagName ? window : this._element),
                (this._config = this._getConfig(e)),
                (this._offsets = []),
                (this._targets = []),
                (this._activeTarget = null),
                (this._scrollHeight = 0),
                j.on(this._scrollElement, "scroll.bs.scrollspy", () => this._process()),
                this.refresh(),
                this._process();
        }
        static get Default() {
            return bn;
        }
        static get NAME() {
            return _n;
        }
        refresh() {
            const t = this._scrollElement === this._scrollElement.window ? "offset" : En,
                e = "auto" === this._config.method ? t : this._config.method,
                n = e === En ? this._getScrollTop() : 0;
            (this._offsets = []),
                (this._targets = []),
                (this._scrollHeight = this._getScrollHeight()),
                V.find(wn, this._config.target)
                    .map((t) => {
                        const s = i(t),
                            o = s ? V.findOne(s) : null;
                        if (o) {
                            const t = o.getBoundingClientRect();
                            if (t.width || t.height) return [U[e](o).top + n, s];
                        }
                        return null;
                    })
                    .filter((t) => t)
                    .sort((t, e) => t[0] - e[0])
                    .forEach((t) => {
                        this._offsets.push(t[0]), this._targets.push(t[1]);
                    });
        }
        dispose() {
            j.off(this._scrollElement, ".bs.scrollspy"), super.dispose();
        }
        _getConfig(t) {
            return ((t = { ...bn, ...U.getDataAttributes(this._element), ...("object" == typeof t && t ? t : {}) }).target = r(t.target) || document.documentElement), a(_n, t, vn), t;
        }
        _getScrollTop() {
            return this._scrollElement === window ? this._scrollElement.pageYOffset : this._scrollElement.scrollTop;
        }
        _getScrollHeight() {
            return this._scrollElement.scrollHeight || Math.max(document.body.scrollHeight, document.documentElement.scrollHeight);
        }
        _getOffsetHeight() {
            return this._scrollElement === window ? window.innerHeight : this._scrollElement.getBoundingClientRect().height;
        }
        _process() {
            const t = this._getScrollTop() + this._config.offset,
                e = this._getScrollHeight(),
                i = this._config.offset + e - this._getOffsetHeight();
            if ((this._scrollHeight !== e && this.refresh(), t >= i)) {
                const t = this._targets[this._targets.length - 1];
                this._activeTarget !== t && this._activate(t);
            } else {
                if (this._activeTarget && t < this._offsets[0] && this._offsets[0] > 0) return (this._activeTarget = null), void this._clear();
                for (let e = this._offsets.length; e--; ) this._activeTarget !== this._targets[e] && t >= this._offsets[e] && (void 0 === this._offsets[e + 1] || t < this._offsets[e + 1]) && this._activate(this._targets[e]);
            }
        }
        _activate(t) {
            (this._activeTarget = t), this._clear();
            const e = wn.split(",").map((e) => `${e}[data-bs-target="${t}"],${e}[href="${t}"]`),
                i = V.findOne(e.join(","), this._config.target);
            i.classList.add(yn),
                i.classList.contains("dropdown-item")
                    ? V.findOne(".dropdown-toggle", i.closest(".dropdown")).classList.add(yn)
                    : V.parents(i, ".nav, .list-group").forEach((t) => {
                          V.prev(t, ".nav-link, .list-group-item").forEach((t) => t.classList.add(yn)),
                              V.prev(t, ".nav-item").forEach((t) => {
                                  V.children(t, ".nav-link").forEach((t) => t.classList.add(yn));
                              });
                      }),
                j.trigger(this._scrollElement, "activate.bs.scrollspy", { relatedTarget: t });
        }
        _clear() {
            V.find(wn, this._config.target)
                .filter((t) => t.classList.contains(yn))
                .forEach((t) => t.classList.remove(yn));
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = An.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t]();
                }
            });
        }
    }
    j.on(window, "load.bs.scrollspy.data-api", () => {
        V.find('[data-bs-spy="scroll"]').forEach((t) => new An(t));
    }),
        g(An);
    const Tn = "active",
        On = "fade",
        Cn = "show",
        kn = ".active",
        Ln = ":scope > li > .active";
    class xn extends B {
        static get NAME() {
            return "tab";
        }
        show() {
            if (this._element.parentNode && this._element.parentNode.nodeType === Node.ELEMENT_NODE && this._element.classList.contains(Tn)) return;
            let t;
            const e = n(this._element),
                i = this._element.closest(".nav, .list-group");
            if (i) {
                const e = "UL" === i.nodeName || "OL" === i.nodeName ? Ln : kn;
                (t = V.find(e, i)), (t = t[t.length - 1]);
            }
            const s = t ? j.trigger(t, "hide.bs.tab", { relatedTarget: this._element }) : null;
            if (j.trigger(this._element, "show.bs.tab", { relatedTarget: t }).defaultPrevented || (null !== s && s.defaultPrevented)) return;
            this._activate(this._element, i);
            const o = () => {
                j.trigger(t, "hidden.bs.tab", { relatedTarget: this._element }), j.trigger(this._element, "shown.bs.tab", { relatedTarget: t });
            };
            e ? this._activate(e, e.parentNode, o) : o();
        }
        _activate(t, e, i) {
            const n = (!e || ("UL" !== e.nodeName && "OL" !== e.nodeName) ? V.children(e, kn) : V.find(Ln, e))[0],
                s = i && n && n.classList.contains(On),
                o = () => this._transitionComplete(t, n, i);
            n && s ? (n.classList.remove(Cn), this._queueCallback(o, t, !0)) : o();
        }
        _transitionComplete(t, e, i) {
            if (e) {
                e.classList.remove(Tn);
                const t = V.findOne(":scope > .dropdown-menu .active", e.parentNode);
                t && t.classList.remove(Tn), "tab" === e.getAttribute("role") && e.setAttribute("aria-selected", !1);
            }
            t.classList.add(Tn), "tab" === t.getAttribute("role") && t.setAttribute("aria-selected", !0), u(t), t.classList.contains(On) && t.classList.add(Cn);
            let n = t.parentNode;
            if ((n && "LI" === n.nodeName && (n = n.parentNode), n && n.classList.contains("dropdown-menu"))) {
                const e = t.closest(".dropdown");
                e && V.find(".dropdown-toggle", e).forEach((t) => t.classList.add(Tn)), t.setAttribute("aria-expanded", !0);
            }
            i && i();
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = xn.getOrCreateInstance(this);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t]();
                }
            });
        }
    }
    j.on(document, "click.bs.tab.data-api", '[data-bs-toggle="tab"], [data-bs-toggle="pill"], [data-bs-toggle="list"]', function (t) {
        ["A", "AREA"].includes(this.tagName) && t.preventDefault(), c(this) || xn.getOrCreateInstance(this).show();
    }),
        g(xn);
    const Dn = "toast",
        Sn = "hide",
        Nn = "show",
        In = "showing",
        Pn = { animation: "boolean", autohide: "boolean", delay: "number" },
        jn = { animation: !0, autohide: !0, delay: 5e3 };
    class Mn extends B {
        constructor(t, e) {
            super(t), (this._config = this._getConfig(e)), (this._timeout = null), (this._hasMouseInteraction = !1), (this._hasKeyboardInteraction = !1), this._setListeners();
        }
        static get DefaultType() {
            return Pn;
        }
        static get Default() {
            return jn;
        }
        static get NAME() {
            return Dn;
        }
        show() {
            j.trigger(this._element, "show.bs.toast").defaultPrevented ||
                (this._clearTimeout(),
                this._config.animation && this._element.classList.add("fade"),
                this._element.classList.remove(Sn),
                u(this._element),
                this._element.classList.add(Nn),
                this._element.classList.add(In),
                this._queueCallback(
                    () => {
                        this._element.classList.remove(In), j.trigger(this._element, "shown.bs.toast"), this._maybeScheduleHide();
                    },
                    this._element,
                    this._config.animation
                ));
        }
        hide() {
            this._element.classList.contains(Nn) &&
                (j.trigger(this._element, "hide.bs.toast").defaultPrevented ||
                    (this._element.classList.add(In),
                    this._queueCallback(
                        () => {
                            this._element.classList.add(Sn), this._element.classList.remove(In), this._element.classList.remove(Nn), j.trigger(this._element, "hidden.bs.toast");
                        },
                        this._element,
                        this._config.animation
                    )));
        }
        dispose() {
            this._clearTimeout(), this._element.classList.contains(Nn) && this._element.classList.remove(Nn), super.dispose();
        }
        _getConfig(t) {
            return (t = { ...jn, ...U.getDataAttributes(this._element), ...("object" == typeof t && t ? t : {}) }), a(Dn, t, this.constructor.DefaultType), t;
        }
        _maybeScheduleHide() {
            this._config.autohide &&
                (this._hasMouseInteraction ||
                    this._hasKeyboardInteraction ||
                    (this._timeout = setTimeout(() => {
                        this.hide();
                    }, this._config.delay)));
        }
        _onInteraction(t, e) {
            switch (t.type) {
                case "mouseover":
                case "mouseout":
                    this._hasMouseInteraction = e;
                    break;
                case "focusin":
                case "focusout":
                    this._hasKeyboardInteraction = e;
            }
            if (e) return void this._clearTimeout();
            const i = t.relatedTarget;
            this._element === i || this._element.contains(i) || this._maybeScheduleHide();
        }
        _setListeners() {
            j.on(this._element, "mouseover.bs.toast", (t) => this._onInteraction(t, !0)),
                j.on(this._element, "mouseout.bs.toast", (t) => this._onInteraction(t, !1)),
                j.on(this._element, "focusin.bs.toast", (t) => this._onInteraction(t, !0)),
                j.on(this._element, "focusout.bs.toast", (t) => this._onInteraction(t, !1));
        }
        _clearTimeout() {
            clearTimeout(this._timeout), (this._timeout = null);
        }
        static jQueryInterface(t) {
            return this.each(function () {
                const e = Mn.getOrCreateInstance(this, t);
                if ("string" == typeof t) {
                    if (void 0 === e[t]) throw new TypeError(`No method named "${t}"`);
                    e[t](this);
                }
            });
        }
    }
    return R(Mn), g(Mn), { Alert: W, Button: z, Carousel: st, Collapse: pt, Dropdown: hi, Modal: Hi, Offcanvas: Fi, Popover: gn, ScrollSpy: An, Tab: xn, Toast: Mn, Tooltip: un };
});


// ------------------------------------------------ Bootstrap Bundle Min js End -----------------------



// --------------------------------------------- Metis menu min js ------------------------------------------

!(function (e, n) {
    "object" == typeof exports && "undefined" != typeof module ? (module.exports = n(require("jquery"))) : "function" == typeof define && define.amd ? define(["jquery"], n) : ((e = e || self).metisMenu = n(e.jQuery));
})(this, function (o) {
    "use strict";
    function a() {
        return (a =
            Object.assign ||
            function (e) {
                for (var n = 1; n < arguments.length; n++) {
                    var t = arguments[n];
                    for (var i in t) Object.prototype.hasOwnProperty.call(t, i) && (e[i] = t[i]);
                }
                return e;
            }).apply(this, arguments);
    }
    o = o && Object.prototype.hasOwnProperty.call(o, "default") ? o.default : o;
    var i,
        n,
        r,
        s =
            ((n = "transitionend"),
            (r = {
                TRANSITION_END: "mmTransitionEnd",
                triggerTransitionEnd: function (e) {
                    i(e).trigger(n);
                },
                supportsTransitionEnd: function () {
                    return Boolean(n);
                },
            }),
            ((i = o).fn.mmEmulateTransitionEnd = e),
            (i.event.special[r.TRANSITION_END] = {
                bindType: n,
                delegateType: n,
                handle: function (e) {
                    if (i(e.target).is(this)) return e.handleObj.handler.apply(this, arguments);
                },
            }),
            r);
    function e(e) {
        var n = this,
            t = !1;
        return (
            i(this).one(r.TRANSITION_END, function () {
                t = !0;
            }),
            setTimeout(function () {
                t || r.triggerTransitionEnd(n);
            }, e),
            this
        );
    }
    var t = "metisMenu",
        g = "metisMenu",
        l = "." + g,
        h = o.fn[t],
        f = { toggle: !0, preventDefault: !0, triggerElement: "a", parentTrigger: "li", subMenu: "ul" },
        d = { SHOW: "show" + l, SHOWN: "shown" + l, HIDE: "hide" + l, HIDDEN: "hidden" + l, CLICK_DATA_API: "click" + l + ".data-api" },
        u = "metismenu",
        c = "mm-active",
        p = "mm-show",
        m = "mm-collapse",
        T = "mm-collapsing",
        v = (function () {
            function r(e, n) {
                (this.element = e), (this.config = a({}, f, {}, n)), (this.transitioning = null), this.init();
            }
            var e = r.prototype;
            return (
                (e.init = function () {
                    var a = this,
                        s = this.config,
                        e = o(this.element);
                    e.addClass(u),
                        e
                            .find(s.parentTrigger + "." + c)
                            .children(s.triggerElement)
                            .attr("aria-expanded", "true"),
                        e
                            .find(s.parentTrigger + "." + c)
                            .parents(s.parentTrigger)
                            .addClass(c),
                        e
                            .find(s.parentTrigger + "." + c)
                            .parents(s.parentTrigger)
                            .children(s.triggerElement)
                            .attr("aria-expanded", "true"),
                        e
                            .find(s.parentTrigger + "." + c)
                            .has(s.subMenu)
                            .children(s.subMenu)
                            .addClass(m + " " + p),
                        e
                            .find(s.parentTrigger)
                            .not("." + c)
                            .has(s.subMenu)
                            .children(s.subMenu)
                            .addClass(m),
                        e
                            .find(s.parentTrigger)
                            .children(s.triggerElement)
                            .on(d.CLICK_DATA_API, function (e) {
                                var n = o(this);
                                if ("true" !== n.attr("aria-disabled")) {
                                    s.preventDefault && "#" === n.attr("href") && e.preventDefault();
                                    var t = n.parent(s.parentTrigger),
                                        i = t.siblings(s.parentTrigger),
                                        r = i.children(s.triggerElement);
                                    t.hasClass(c) ? (n.attr("aria-expanded", "false"), a.removeActive(t)) : (n.attr("aria-expanded", "true"), a.setActive(t), s.toggle && (a.removeActive(i), r.attr("aria-expanded", "false"))),
                                        s.onTransitionStart && s.onTransitionStart(e);
                                }
                            });
                }),
                (e.setActive = function (e) {
                    o(e).addClass(c);
                    var n = o(e).children(this.config.subMenu);
                    0 < n.length && !n.hasClass(p) && this.show(n);
                }),
                (e.removeActive = function (e) {
                    o(e).removeClass(c);
                    var n = o(e).children(this.config.subMenu + "." + p);
                    0 < n.length && this.hide(n);
                }),
                (e.show = function (e) {
                    var n = this;
                    if (!this.transitioning && !o(e).hasClass(T)) {
                        var t = o(e),
                            i = o.Event(d.SHOW);
                        if ((t.trigger(i), !i.isDefaultPrevented())) {
                            if ((t.parent(this.config.parentTrigger).addClass(c), this.config.toggle)) {
                                var r = t
                                    .parent(this.config.parentTrigger)
                                    .siblings()
                                    .children(this.config.subMenu + "." + p);
                                this.hide(r);
                            }
                            t.removeClass(m).addClass(T).height(0), this.setTransitioning(!0);
                            t.height(e[0].scrollHeight)
                                .one(s.TRANSITION_END, function () {
                                    n.config &&
                                        n.element &&
                                        (t
                                            .removeClass(T)
                                            .addClass(m + " " + p)
                                            .height(""),
                                        n.setTransitioning(!1),
                                        t.trigger(d.SHOWN));
                                })
                                .mmEmulateTransitionEnd(350);
                        }
                    }
                }),
                (e.hide = function (e) {
                    var n = this;
                    if (!this.transitioning && o(e).hasClass(p)) {
                        var t = o(e),
                            i = o.Event(d.HIDE);
                        if ((t.trigger(i), !i.isDefaultPrevented())) {
                            t.parent(this.config.parentTrigger).removeClass(c), t.height(t.height())[0].offsetHeight, t.addClass(T).removeClass(m).removeClass(p), this.setTransitioning(!0);
                            var r = function () {
                                n.config && n.element && (n.transitioning && n.config.onTransitionEnd && n.config.onTransitionEnd(), n.setTransitioning(!1), t.trigger(d.HIDDEN), t.removeClass(T).addClass(m));
                            };
                            0 === t.height() || "none" === t.css("display") ? r() : t.height(0).one(s.TRANSITION_END, r).mmEmulateTransitionEnd(350);
                        }
                    }
                }),
                (e.setTransitioning = function (e) {
                    this.transitioning = e;
                }),
                (e.dispose = function () {
                    o.removeData(this.element, g), o(this.element).find(this.config.parentTrigger).children(this.config.triggerElement).off(d.CLICK_DATA_API), (this.transitioning = null), (this.config = null), (this.element = null);
                }),
                (r.jQueryInterface = function (i) {
                    return this.each(function () {
                        var e = o(this),
                            n = e.data(g),
                            t = a({}, f, {}, e.data(), {}, "object" == typeof i && i ? i : {});
                        if ((n || ((n = new r(this, t)), e.data(g, n)), "string" == typeof i)) {
                            if (void 0 === n[i]) throw new Error('No method named "' + i + '"');
                            n[i]();
                        }
                    });
                }),
                r
            );
        })();
    return (
        (o.fn[t] = v.jQueryInterface),
        (o.fn[t].Constructor = v),
        (o.fn[t].noConflict = function () {
            return (o.fn[t] = h), v.jQueryInterface;
        }),
        v
    );
});



// ---------------------------------------------- Metis Menu min js End -------------------------------------------------


// ---------------------------------------------- Simple Sidebar js ----------------------------------------


!(function (t, e) {
    "object" == typeof exports && "undefined" != typeof module ? (module.exports = e()) : "function" == typeof define && define.amd ? define(e) : ((t = t || self).SimpleBar = e());
})(this, function () {
    "use strict";
    var t = function (t) {
            if ("function" != typeof t) throw TypeError(String(t) + " is not a function");
            return t;
        },
        e = function (t) {
            try {
                return !!t();
            } catch (t) {
                return !0;
            }
        },
        i = {}.toString,
        r = function (t) {
            return i.call(t).slice(8, -1);
        },
        n = "".split,
        s = e(function () {
            return !Object("z").propertyIsEnumerable(0);
        })
            ? function (t) {
                  return "String" == r(t) ? n.call(t, "") : Object(t);
              }
            : Object,
        o = function (t) {
            if (null == t) throw TypeError("Can't call method on " + t);
            return t;
        },
        a = function (t) {
            return Object(o(t));
        },
        l = Math.ceil,
        c = Math.floor,
        u = function (t) {
            return isNaN((t = +t)) ? 0 : (t > 0 ? c : l)(t);
        },
        h = Math.min,
        f = function (t) {
            return t > 0 ? h(u(t), 9007199254740991) : 0;
        },
        d = function (t) {
            return "object" == typeof t ? null !== t : "function" == typeof t;
        },
        p =
            Array.isArray ||
            function (t) {
                return "Array" == r(t);
            },
        v = "undefined" != typeof globalThis ? globalThis : "undefined" != typeof window ? window : "undefined" != typeof global ? global : "undefined" != typeof self ? self : {};
    function g(t, e) {
        return t((e = { exports: {} }), e.exports), e.exports;
    }
    var b,
        m,
        y,
        x,
        E = "object" == typeof window && window && window.Math == Math ? window : "object" == typeof self && self && self.Math == Math ? self : Function("return this")(),
        w = !e(function () {
            return (
                7 !=
                Object.defineProperty({}, "a", {
                    get: function () {
                        return 7;
                    },
                }).a
            );
        }),
        O = E.document,
        _ = d(O) && d(O.createElement),
        S =
            !w &&
            !e(function () {
                return (
                    7 !=
                    Object.defineProperty(((t = "div"), _ ? O.createElement(t) : {}), "a", {
                        get: function () {
                            return 7;
                        },
                    }).a
                );
                var t;
            }),
        L = function (t) {
            if (!d(t)) throw TypeError(String(t) + " is not an object");
            return t;
        },
        A = function (t, e) {
            if (!d(t)) return t;
            var i, r;
            if (e && "function" == typeof (i = t.toString) && !d((r = i.call(t)))) return r;
            if ("function" == typeof (i = t.valueOf) && !d((r = i.call(t)))) return r;
            if (!e && "function" == typeof (i = t.toString) && !d((r = i.call(t)))) return r;
            throw TypeError("Can't convert object to primitive value");
        },
        M = Object.defineProperty,
        k = {
            f: w
                ? M
                : function (t, e, i) {
                      if ((L(t), (e = A(e, !0)), L(i), S))
                          try {
                              return M(t, e, i);
                          } catch (t) {}
                      if ("get" in i || "set" in i) throw TypeError("Accessors not supported");
                      return "value" in i && (t[e] = i.value), t;
                  },
        },
        W = function (t, e) {
            return { enumerable: !(1 & t), configurable: !(2 & t), writable: !(4 & t), value: e };
        },
        T = w
            ? function (t, e, i) {
                  return k.f(t, e, W(1, i));
              }
            : function (t, e, i) {
                  return (t[e] = i), t;
              },
        R = function (t, e) {
            try {
                T(E, t, e);
            } catch (i) {
                E[t] = e;
            }
            return e;
        },
        j = g(function (t) {
            var e = E["__core-js_shared__"] || R("__core-js_shared__", {});
            (t.exports = function (t, i) {
                return e[t] || (e[t] = void 0 !== i ? i : {});
            })("versions", []).push({ version: "3.0.1", mode: "global", copyright: "© 2019 Denis Pushkarev (zloirock.ru)" });
        }),
        C = 0,
        N = Math.random(),
        z = function (t) {
            return "Symbol(".concat(void 0 === t ? "" : t, ")_", (++C + N).toString(36));
        },
        D = !e(function () {
            return !String(Symbol());
        }),
        V = j("wks"),
        I = E.Symbol,
        B = function (t) {
            return V[t] || (V[t] = (D && I[t]) || (D ? I : z)("Symbol." + t));
        },
        P = B("species"),
        H = function (t, e) {
            var i;
            return p(t) && ("function" != typeof (i = t.constructor) || (i !== Array && !p(i.prototype)) ? d(i) && null === (i = i[P]) && (i = void 0) : (i = void 0)), new (void 0 === i ? Array : i)(0 === e ? 0 : e);
        },
        F = function (e, i) {
            var r = 1 == e,
                n = 2 == e,
                o = 3 == e,
                l = 4 == e,
                c = 6 == e,
                u = 5 == e || c,
                h = i || H;
            return function (i, d, p) {
                for (
                    var v,
                        g,
                        b = a(i),
                        m = s(b),
                        y = (function (e, i, r) {
                            if ((t(e), void 0 === i)) return e;
                            switch (r) {
                                case 0:
                                    return function () {
                                        return e.call(i);
                                    };
                                case 1:
                                    return function (t) {
                                        return e.call(i, t);
                                    };
                                case 2:
                                    return function (t, r) {
                                        return e.call(i, t, r);
                                    };
                                case 3:
                                    return function (t, r, n) {
                                        return e.call(i, t, r, n);
                                    };
                            }
                            return function () {
                                return e.apply(i, arguments);
                            };
                        })(d, p, 3),
                        x = f(m.length),
                        E = 0,
                        w = r ? h(i, x) : n ? h(i, 0) : void 0;
                    x > E;
                    E++
                )
                    if ((u || E in m) && ((g = y((v = m[E]), E, b)), e))
                        if (r) w[E] = g;
                        else if (g)
                            switch (e) {
                                case 3:
                                    return !0;
                                case 5:
                                    return v;
                                case 6:
                                    return E;
                                case 2:
                                    w.push(v);
                            }
                        else if (l) return !1;
                return c ? -1 : o || l ? l : w;
            };
        },
        q = B("species"),
        $ = {}.propertyIsEnumerable,
        Y = Object.getOwnPropertyDescriptor,
        X = {
            f:
                Y && !$.call({ 1: 2 }, 1)
                    ? function (t) {
                          var e = Y(this, t);
                          return !!e && e.enumerable;
                      }
                    : $,
        },
        G = function (t) {
            return s(o(t));
        },
        K = {}.hasOwnProperty,
        U = function (t, e) {
            return K.call(t, e);
        },
        J = Object.getOwnPropertyDescriptor,
        Q = {
            f: w
                ? J
                : function (t, e) {
                      if (((t = G(t)), (e = A(e, !0)), S))
                          try {
                              return J(t, e);
                          } catch (t) {}
                      if (U(t, e)) return W(!X.f.call(t, e), t[e]);
                  },
        },
        Z = j("native-function-to-string", Function.toString),
        tt = E.WeakMap,
        et = "function" == typeof tt && /native code/.test(Z.call(tt)),
        it = j("keys"),
        rt = {},
        nt = E.WeakMap;
    if (et) {
        var st = new nt(),
            ot = st.get,
            at = st.has,
            lt = st.set;
        (b = function (t, e) {
            return lt.call(st, t, e), e;
        }),
            (m = function (t) {
                return ot.call(st, t) || {};
            }),
            (y = function (t) {
                return at.call(st, t);
            });
    } else {
        var ct = it[(x = "state")] || (it[x] = z(x));
        (rt[ct] = !0),
            (b = function (t, e) {
                return T(t, ct, e), e;
            }),
            (m = function (t) {
                return U(t, ct) ? t[ct] : {};
            }),
            (y = function (t) {
                return U(t, ct);
            });
    }
    var ut,
        ht,
        ft = {
            set: b,
            get: m,
            has: y,
            enforce: function (t) {
                return y(t) ? m(t) : b(t, {});
            },
            getterFor: function (t) {
                return function (e) {
                    var i;
                    if (!d(e) || (i = m(e)).type !== t) throw TypeError("Incompatible receiver, " + t + " required");
                    return i;
                };
            },
        },
        dt = g(function (t) {
            var e = ft.get,
                i = ft.enforce,
                r = String(Z).split("toString");
            j("inspectSource", function (t) {
                return Z.call(t);
            }),
                (t.exports = function (t, e, n, s) {
                    var o = !!s && !!s.unsafe,
                        a = !!s && !!s.enumerable,
                        l = !!s && !!s.noTargetGet;
                    "function" == typeof n && ("string" != typeof e || U(n, "name") || T(n, "name", e), (i(n).source = r.join("string" == typeof e ? e : ""))),
                        t !== E ? (o ? !l && t[e] && (a = !0) : delete t[e], a ? (t[e] = n) : T(t, e, n)) : a ? (t[e] = n) : R(e, n);
                })(Function.prototype, "toString", function () {
                    return ("function" == typeof this && e(this).source) || Z.call(this);
                });
        }),
        pt = Math.max,
        vt = Math.min,
        gt =
            ((ut = !1),
            function (t, e, i) {
                var r,
                    n = G(t),
                    s = f(n.length),
                    o = (function (t, e) {
                        var i = u(t);
                        return i < 0 ? pt(i + e, 0) : vt(i, e);
                    })(i, s);
                if (ut && e != e) {
                    for (; s > o; ) if ((r = n[o++]) != r) return !0;
                } else for (; s > o; o++) if ((ut || o in n) && n[o] === e) return ut || o || 0;
                return !ut && -1;
            }),
        bt = function (t, e) {
            var i,
                r = G(t),
                n = 0,
                s = [];
            for (i in r) !U(rt, i) && U(r, i) && s.push(i);
            for (; e.length > n; ) U(r, (i = e[n++])) && (~gt(s, i) || s.push(i));
            return s;
        },
        mt = ["constructor", "hasOwnProperty", "isPrototypeOf", "propertyIsEnumerable", "toLocaleString", "toString", "valueOf"],
        yt = mt.concat("length", "prototype"),
        xt = {
            f:
                Object.getOwnPropertyNames ||
                function (t) {
                    return bt(t, yt);
                },
        },
        Et = { f: Object.getOwnPropertySymbols },
        wt = E.Reflect,
        Ot =
            (wt && wt.ownKeys) ||
            function (t) {
                var e = xt.f(L(t)),
                    i = Et.f;
                return i ? e.concat(i(t)) : e;
            },
        _t = function (t, e) {
            for (var i = Ot(e), r = k.f, n = Q.f, s = 0; s < i.length; s++) {
                var o = i[s];
                U(t, o) || r(t, o, n(e, o));
            }
        },
        St = /#|\.prototype\./,
        Lt = function (t, i) {
            var r = Mt[At(t)];
            return r == Wt || (r != kt && ("function" == typeof i ? e(i) : !!i));
        },
        At = (Lt.normalize = function (t) {
            return String(t).replace(St, ".").toLowerCase();
        }),
        Mt = (Lt.data = {}),
        kt = (Lt.NATIVE = "N"),
        Wt = (Lt.POLYFILL = "P"),
        Tt = Lt,
        Rt = Q.f,
        jt = function (t, e) {
            var i,
                r,
                n,
                s,
                o,
                a = t.target,
                l = t.global,
                c = t.stat;
            if ((i = l ? E : c ? E[a] || R(a, {}) : (E[a] || {}).prototype))
                for (r in e) {
                    if (((s = e[r]), (n = t.noTargetGet ? (o = Rt(i, r)) && o.value : i[r]), !Tt(l ? r : a + (c ? "." : "#") + r, t.forced) && void 0 !== n)) {
                        if (typeof s == typeof n) continue;
                        _t(s, n);
                    }
                    (t.sham || (n && n.sham)) && T(s, "sham", !0), dt(i, r, s, t);
                }
        },
        Ct = F(2);
    jt(
        {
            target: "Array",
            proto: !0,
            forced: !((ht = "filter"),
            !e(function () {
                var t = [];
                return (
                    ((t.constructor = {})[q] = function () {
                        return { foo: 1 };
                    }),
                    1 !== t[ht](Boolean).foo
                );
            })),
        },
        {
            filter: function (t) {
                return Ct(this, t, arguments[1]);
            },
        }
    );
    var Nt = function (t, i) {
            var r = [][t];
            return (
                !r ||
                !e(function () {
                    r.call(
                        null,
                        i ||
                            function () {
                                throw 1;
                            },
                        1
                    );
                })
            );
        },
        zt = [].forEach,
        Dt = F(0),
        Vt = Nt("forEach")
            ? function (t) {
                  return Dt(this, t, arguments[1]);
              }
            : zt;
    jt({ target: "Array", proto: !0, forced: [].forEach != Vt }, { forEach: Vt });
    jt(
        { target: "Array", proto: !0, forced: Nt("reduce") },
        {
            reduce: function (e) {
                return (function (e, i, r, n, o) {
                    t(i);
                    var l = a(e),
                        c = s(l),
                        u = f(l.length),
                        h = o ? u - 1 : 0,
                        d = o ? -1 : 1;
                    if (r < 2)
                        for (;;) {
                            if (h in c) {
                                (n = c[h]), (h += d);
                                break;
                            }
                            if (((h += d), o ? h < 0 : u <= h)) throw TypeError("Reduce of empty array with no initial value");
                        }
                    for (; o ? h >= 0 : u > h; h += d) h in c && (n = i(n, c[h], h, l));
                    return n;
                })(this, e, arguments.length, arguments[1], !1);
            },
        }
    );
    var It = k.f,
        Bt = Function.prototype,
        Pt = Bt.toString,
        Ht = /^\s*function ([^ (]*)/;
    !w ||
        "name" in Bt ||
        It(Bt, "name", {
            configurable: !0,
            get: function () {
                try {
                    return Pt.call(this).match(Ht)[1];
                } catch (t) {
                    return "";
                }
            },
        });
    var Ft =
            Object.keys ||
            function (t) {
                return bt(t, mt);
            },
        qt = Object.assign,
        $t =
            !qt ||
            e(function () {
                var t = {},
                    e = {},
                    i = Symbol();
                return (
                    (t[i] = 7),
                    "abcdefghijklmnopqrst".split("").forEach(function (t) {
                        e[t] = t;
                    }),
                    7 != qt({}, t)[i] || "abcdefghijklmnopqrst" != Ft(qt({}, e)).join("")
                );
            })
                ? function (t, e) {
                      for (var i = a(t), r = arguments.length, n = 1, o = Et.f, l = X.f; r > n; ) for (var c, u = s(arguments[n++]), h = o ? Ft(u).concat(o(u)) : Ft(u), f = h.length, d = 0; f > d; ) l.call(u, (c = h[d++])) && (i[c] = u[c]);
                      return i;
                  }
                : qt;
    jt({ target: "Object", stat: !0, forced: Object.assign !== $t }, { assign: $t });
    var Yt = "\t\n\v\f\r                　\u2028\u2029\ufeff",
        Xt = "[" + Yt + "]",
        Gt = RegExp("^" + Xt + Xt + "*"),
        Kt = RegExp(Xt + Xt + "*$"),
        Ut = E.parseInt,
        Jt = /^[-+]?0[xX]/,
        Qt =
            8 !== Ut(Yt + "08") || 22 !== Ut(Yt + "0x16")
                ? function (t, e) {
                      var i = (function (t, e) {
                          return (t = String(o(t))), 1 & e && (t = t.replace(Gt, "")), 2 & e && (t = t.replace(Kt, "")), t;
                      })(String(t), 3);
                      return Ut(i, e >>> 0 || (Jt.test(i) ? 16 : 10));
                  }
                : Ut;
    jt({ global: !0, forced: parseInt != Qt }, { parseInt: Qt });
    var Zt,
        te,
        ee = RegExp.prototype.exec,
        ie = String.prototype.replace,
        re = ee,
        ne = ((Zt = /a/), (te = /b*/g), ee.call(Zt, "a"), ee.call(te, "a"), 0 !== Zt.lastIndex || 0 !== te.lastIndex),
        se = void 0 !== /()??/.exec("")[1];
    (ne || se) &&
        (re = function (t) {
            var e,
                i,
                r,
                n,
                s = this;
            return (
                se &&
                    (i = new RegExp(
                        "^" + s.source + "$(?!\\s)",
                        function () {
                            var t = L(this),
                                e = "";
                            return t.global && (e += "g"), t.ignoreCase && (e += "i"), t.multiline && (e += "m"), t.unicode && (e += "u"), t.sticky && (e += "y"), e;
                        }.call(s)
                    )),
                ne && (e = s.lastIndex),
                (r = ee.call(s, t)),
                ne && r && (s.lastIndex = s.global ? r.index + r[0].length : e),
                se &&
                    r &&
                    r.length > 1 &&
                    ie.call(r[0], i, function () {
                        for (n = 1; n < arguments.length - 2; n++) void 0 === arguments[n] && (r[n] = void 0);
                    }),
                r
            );
        });
    var oe = re;
    jt({ target: "RegExp", proto: !0, forced: /./.exec !== oe }, { exec: oe });
    var ae = function (t, e, i) {
            return (
                e +
                (i
                    ? (function (t, e, i) {
                          var r,
                              n,
                              s = String(o(t)),
                              a = u(e),
                              l = s.length;
                          return a < 0 || a >= l
                              ? i
                                  ? ""
                                  : void 0
                              : (r = s.charCodeAt(a)) < 55296 || r > 56319 || a + 1 === l || (n = s.charCodeAt(a + 1)) < 56320 || n > 57343
                              ? i
                                  ? s.charAt(a)
                                  : r
                              : i
                              ? s.slice(a, a + 2)
                              : n - 56320 + ((r - 55296) << 10) + 65536;
                      })(t, e, !0).length
                    : 1)
            );
        },
        le = function (t, e) {
            var i = t.exec;
            if ("function" == typeof i) {
                var n = i.call(t, e);
                if ("object" != typeof n) throw TypeError("RegExp exec method returned something other than an Object or null");
                return n;
            }
            if ("RegExp" !== r(t)) throw TypeError("RegExp#exec called on incompatible receiver");
            return oe.call(t, e);
        },
        ce = B("species"),
        ue = !e(function () {
            var t = /./;
            return (
                (t.exec = function () {
                    var t = [];
                    return (t.groups = { a: "7" }), t;
                }),
                "7" !== "".replace(t, "$<a>")
            );
        }),
        he = !e(function () {
            var t = /(?:)/,
                e = t.exec;
            t.exec = function () {
                return e.apply(this, arguments);
            };
            var i = "ab".split(t);
            return 2 !== i.length || "a" !== i[0] || "b" !== i[1];
        }),
        fe = function (t, i, r, n) {
            var s = B(t),
                o = !e(function () {
                    var e = {};
                    return (
                        (e[s] = function () {
                            return 7;
                        }),
                        7 != ""[t](e)
                    );
                }),
                a =
                    o &&
                    !e(function () {
                        var e = !1,
                            i = /a/;
                        return (
                            (i.exec = function () {
                                return (e = !0), null;
                            }),
                            "split" === t &&
                                ((i.constructor = {}),
                                (i.constructor[ce] = function () {
                                    return i;
                                })),
                            i[s](""),
                            !e
                        );
                    });
            if (!o || !a || ("replace" === t && !ue) || ("split" === t && !he)) {
                var l = /./[s],
                    c = r(s, ""[t], function (t, e, i, r, n) {
                        return e.exec === oe ? (o && !n ? { done: !0, value: l.call(e, i, r) } : { done: !0, value: t.call(i, e, r) }) : { done: !1 };
                    }),
                    u = c[0],
                    h = c[1];
                dt(String.prototype, t, u),
                    dt(
                        RegExp.prototype,
                        s,
                        2 == i
                            ? function (t, e) {
                                  return h.call(t, this, e);
                              }
                            : function (t) {
                                  return h.call(t, this);
                              }
                    ),
                    n && T(RegExp.prototype[s], "sham", !0);
            }
        };
    fe("match", 1, function (t, e, i) {
        return [
            function (e) {
                var i = o(this),
                    r = null == e ? void 0 : e[t];
                return void 0 !== r ? r.call(e, i) : new RegExp(e)[t](String(i));
            },
            function (t) {
                var r = i(e, t, this);
                if (r.done) return r.value;
                var n = L(t),
                    s = String(this);
                if (!n.global) return le(n, s);
                var o = n.unicode;
                n.lastIndex = 0;
                for (var a, l = [], c = 0; null !== (a = le(n, s)); ) {
                    var u = String(a[0]);
                    (l[c] = u), "" === u && (n.lastIndex = ae(s, f(n.lastIndex), o)), c++;
                }
                return 0 === c ? null : l;
            },
        ];
    });
    var de = Math.max,
        pe = Math.min,
        ve = Math.floor,
        ge = /\$([$&`']|\d\d?|<[^>]*>)/g,
        be = /\$([$&`']|\d\d?)/g;
    fe("replace", 2, function (t, e, i) {
        return [
            function (i, r) {
                var n = o(this),
                    s = null == i ? void 0 : i[t];
                return void 0 !== s ? s.call(i, n, r) : e.call(String(n), i, r);
            },
            function (t, n) {
                var s = i(e, t, this, n);
                if (s.done) return s.value;
                var o = L(t),
                    a = String(this),
                    l = "function" == typeof n;
                l || (n = String(n));
                var c = o.global;
                if (c) {
                    var h = o.unicode;
                    o.lastIndex = 0;
                }
                for (var d = []; ; ) {
                    var p = le(o, a);
                    if (null === p) break;
                    if ((d.push(p), !c)) break;
                    "" === String(p[0]) && (o.lastIndex = ae(a, f(o.lastIndex), h));
                }
                for (var v, g = "", b = 0, m = 0; m < d.length; m++) {
                    p = d[m];
                    for (var y = String(p[0]), x = de(pe(u(p.index), a.length), 0), E = [], w = 1; w < p.length; w++) E.push(void 0 === (v = p[w]) ? v : String(v));
                    var O = p.groups;
                    if (l) {
                        var _ = [y].concat(E, x, a);
                        void 0 !== O && _.push(O);
                        var S = String(n.apply(void 0, _));
                    } else S = r(y, a, x, E, O, n);
                    x >= b && ((g += a.slice(b, x) + S), (b = x + y.length));
                }
                return g + a.slice(b);
            },
        ];
        function r(t, i, r, n, s, o) {
            var l = r + t.length,
                c = n.length,
                u = be;
            return (
                void 0 !== s && ((s = a(s)), (u = ge)),
                e.call(o, u, function (e, o) {
                    var a;
                    switch (o.charAt(0)) {
                        case "$":
                            return "$";
                        case "&":
                            return t;
                        case "`":
                            return i.slice(0, r);
                        case "'":
                            return i.slice(l);
                        case "<":
                            a = s[o.slice(1, -1)];
                            break;
                        default:
                            var u = +o;
                            if (0 === u) return e;
                            if (u > c) {
                                var h = ve(u / 10);
                                return 0 === h ? e : h <= c ? (void 0 === n[h - 1] ? o.charAt(1) : n[h - 1] + o.charAt(1)) : e;
                            }
                            a = n[u - 1];
                    }
                    return void 0 === a ? "" : a;
                })
            );
        }
    });
    for (var me in {
        CSSRuleList: 0,
        CSSStyleDeclaration: 0,
        CSSValueList: 0,
        ClientRectList: 0,
        DOMRectList: 0,
        DOMStringList: 0,
        DOMTokenList: 1,
        DataTransferItemList: 0,
        FileList: 0,
        HTMLAllCollection: 0,
        HTMLCollection: 0,
        HTMLFormElement: 0,
        HTMLSelectElement: 0,
        MediaList: 0,
        MimeTypeArray: 0,
        NamedNodeMap: 0,
        NodeList: 1,
        PaintRequestList: 0,
        Plugin: 0,
        PluginArray: 0,
        SVGLengthList: 0,
        SVGNumberList: 0,
        SVGPathSegList: 0,
        SVGPointList: 0,
        SVGStringList: 0,
        SVGTransformList: 0,
        SourceBufferList: 0,
        StyleSheetList: 0,
        TextTrackCueList: 0,
        TextTrackList: 0,
        TouchList: 0,
    }) {
        var ye = E[me],
            xe = ye && ye.prototype;
        if (xe && xe.forEach !== Vt)
            try {
                T(xe, "forEach", Vt);
            } catch (t) {
                xe.forEach = Vt;
            }
    }
    var Ee = "Expected a function",
        we = NaN,
        Oe = "[object Symbol]",
        _e = /^\s+|\s+$/g,
        Se = /^[-+]0x[0-9a-f]+$/i,
        Le = /^0b[01]+$/i,
        Ae = /^0o[0-7]+$/i,
        Me = parseInt,
        ke = "object" == typeof v && v && v.Object === Object && v,
        We = "object" == typeof self && self && self.Object === Object && self,
        Te = ke || We || Function("return this")(),
        Re = Object.prototype.toString,
        je = Math.max,
        Ce = Math.min,
        Ne = function () {
            return Te.Date.now();
        };
    function ze(t, e, i) {
        var r,
            n,
            s,
            o,
            a,
            l,
            c = 0,
            u = !1,
            h = !1,
            f = !0;
        if ("function" != typeof t) throw new TypeError(Ee);
        function d(e) {
            var i = r,
                s = n;
            return (r = n = void 0), (c = e), (o = t.apply(s, i));
        }
        function p(t) {
            var i = t - l;
            return void 0 === l || i >= e || i < 0 || (h && t - c >= s);
        }
        function v() {
            var t = Ne();
            if (p(t)) return g(t);
            a = setTimeout(
                v,
                (function (t) {
                    var i = e - (t - l);
                    return h ? Ce(i, s - (t - c)) : i;
                })(t)
            );
        }
        function g(t) {
            return (a = void 0), f && r ? d(t) : ((r = n = void 0), o);
        }
        function b() {
            var t = Ne(),
                i = p(t);
            if (((r = arguments), (n = this), (l = t), i)) {
                if (void 0 === a)
                    return (function (t) {
                        return (c = t), (a = setTimeout(v, e)), u ? d(t) : o;
                    })(l);
                if (h) return (a = setTimeout(v, e)), d(l);
            }
            return void 0 === a && (a = setTimeout(v, e)), o;
        }
        return (
            (e = Ve(e) || 0),
            De(i) && ((u = !!i.leading), (s = (h = "maxWait" in i) ? je(Ve(i.maxWait) || 0, e) : s), (f = "trailing" in i ? !!i.trailing : f)),
            (b.cancel = function () {
                void 0 !== a && clearTimeout(a), (c = 0), (r = l = n = a = void 0);
            }),
            (b.flush = function () {
                return void 0 === a ? o : g(Ne());
            }),
            b
        );
    }
    function De(t) {
        var e = typeof t;
        return !!t && ("object" == e || "function" == e);
    }
    function Ve(t) {
        if ("number" == typeof t) return t;
        if (
            (function (t) {
                return (
                    "symbol" == typeof t ||
                    ((function (t) {
                        return !!t && "object" == typeof t;
                    })(t) &&
                        Re.call(t) == Oe)
                );
            })(t)
        )
            return we;
        if (De(t)) {
            var e = "function" == typeof t.valueOf ? t.valueOf() : t;
            t = De(e) ? e + "" : e;
        }
        if ("string" != typeof t) return 0 === t ? t : +t;
        t = t.replace(_e, "");
        var i = Le.test(t);
        return i || Ae.test(t) ? Me(t.slice(2), i ? 2 : 8) : Se.test(t) ? we : +t;
    }
    var Ie = function (t, e, i) {
            var r = !0,
                n = !0;
            if ("function" != typeof t) throw new TypeError(Ee);
            return De(i) && ((r = "leading" in i ? !!i.leading : r), (n = "trailing" in i ? !!i.trailing : n)), ze(t, e, { leading: r, maxWait: e, trailing: n });
        },
        Be = "Expected a function",
        Pe = NaN,
        He = "[object Symbol]",
        Fe = /^\s+|\s+$/g,
        qe = /^[-+]0x[0-9a-f]+$/i,
        $e = /^0b[01]+$/i,
        Ye = /^0o[0-7]+$/i,
        Xe = parseInt,
        Ge = "object" == typeof v && v && v.Object === Object && v,
        Ke = "object" == typeof self && self && self.Object === Object && self,
        Ue = Ge || Ke || Function("return this")(),
        Je = Object.prototype.toString,
        Qe = Math.max,
        Ze = Math.min,
        ti = function () {
            return Ue.Date.now();
        };
    function ei(t) {
        var e = typeof t;
        return !!t && ("object" == e || "function" == e);
    }
    function ii(t) {
        if ("number" == typeof t) return t;
        if (
            (function (t) {
                return (
                    "symbol" == typeof t ||
                    ((function (t) {
                        return !!t && "object" == typeof t;
                    })(t) &&
                        Je.call(t) == He)
                );
            })(t)
        )
            return Pe;
        if (ei(t)) {
            var e = "function" == typeof t.valueOf ? t.valueOf() : t;
            t = ei(e) ? e + "" : e;
        }
        if ("string" != typeof t) return 0 === t ? t : +t;
        t = t.replace(Fe, "");
        var i = $e.test(t);
        return i || Ye.test(t) ? Xe(t.slice(2), i ? 2 : 8) : qe.test(t) ? Pe : +t;
    }
    var ri = function (t, e, i) {
            var r,
                n,
                s,
                o,
                a,
                l,
                c = 0,
                u = !1,
                h = !1,
                f = !0;
            if ("function" != typeof t) throw new TypeError(Be);
            function d(e) {
                var i = r,
                    s = n;
                return (r = n = void 0), (c = e), (o = t.apply(s, i));
            }
            function p(t) {
                var i = t - l;
                return void 0 === l || i >= e || i < 0 || (h && t - c >= s);
            }
            function v() {
                var t = ti();
                if (p(t)) return g(t);
                a = setTimeout(
                    v,
                    (function (t) {
                        var i = e - (t - l);
                        return h ? Ze(i, s - (t - c)) : i;
                    })(t)
                );
            }
            function g(t) {
                return (a = void 0), f && r ? d(t) : ((r = n = void 0), o);
            }
            function b() {
                var t = ti(),
                    i = p(t);
                if (((r = arguments), (n = this), (l = t), i)) {
                    if (void 0 === a)
                        return (function (t) {
                            return (c = t), (a = setTimeout(v, e)), u ? d(t) : o;
                        })(l);
                    if (h) return (a = setTimeout(v, e)), d(l);
                }
                return void 0 === a && (a = setTimeout(v, e)), o;
            }
            return (
                (e = ii(e) || 0),
                ei(i) && ((u = !!i.leading), (s = (h = "maxWait" in i) ? Qe(ii(i.maxWait) || 0, e) : s), (f = "trailing" in i ? !!i.trailing : f)),
                (b.cancel = function () {
                    void 0 !== a && clearTimeout(a), (c = 0), (r = l = n = a = void 0);
                }),
                (b.flush = function () {
                    return void 0 === a ? o : g(ti());
                }),
                b
            );
        },
        ni = "Expected a function",
        si = "__lodash_hash_undefined__",
        oi = "[object Function]",
        ai = "[object GeneratorFunction]",
        li = /^\[object .+?Constructor\]$/,
        ci = "object" == typeof v && v && v.Object === Object && v,
        ui = "object" == typeof self && self && self.Object === Object && self,
        hi = ci || ui || Function("return this")();
    var fi = Array.prototype,
        di = Function.prototype,
        pi = Object.prototype,
        vi = hi["__core-js_shared__"],
        gi = (function () {
            var t = /[^.]+$/.exec((vi && vi.keys && vi.keys.IE_PROTO) || "");
            return t ? "Symbol(src)_1." + t : "";
        })(),
        bi = di.toString,
        mi = pi.hasOwnProperty,
        yi = pi.toString,
        xi = RegExp(
            "^" +
                bi
                    .call(mi)
                    .replace(/[\\^$.*+?()[\]{}|]/g, "\\$&")
                    .replace(/hasOwnProperty|(function).*?(?=\\\()| for .+?(?=\\\])/g, "$1.*?") +
                "$"
        ),
        Ei = fi.splice,
        wi = Wi(hi, "Map"),
        Oi = Wi(Object, "create");
    function _i(t) {
        var e = -1,
            i = t ? t.length : 0;
        for (this.clear(); ++e < i; ) {
            var r = t[e];
            this.set(r[0], r[1]);
        }
    }
    function Si(t) {
        var e = -1,
            i = t ? t.length : 0;
        for (this.clear(); ++e < i; ) {
            var r = t[e];
            this.set(r[0], r[1]);
        }
    }
    function Li(t) {
        var e = -1,
            i = t ? t.length : 0;
        for (this.clear(); ++e < i; ) {
            var r = t[e];
            this.set(r[0], r[1]);
        }
    }
    function Ai(t, e) {
        for (var i, r, n = t.length; n--; ) if ((i = t[n][0]) === (r = e) || (i != i && r != r)) return n;
        return -1;
    }
    function Mi(t) {
        return (
            !(!Ri(t) || ((e = t), gi && gi in e)) &&
            ((function (t) {
                var e = Ri(t) ? yi.call(t) : "";
                return e == oi || e == ai;
            })(t) ||
            (function (t) {
                var e = !1;
                if (null != t && "function" != typeof t.toString)
                    try {
                        e = !!(t + "");
                    } catch (t) {}
                return e;
            })(t)
                ? xi
                : li
            ).test(
                (function (t) {
                    if (null != t) {
                        try {
                            return bi.call(t);
                        } catch (t) {}
                        try {
                            return t + "";
                        } catch (t) {}
                    }
                    return "";
                })(t)
            )
        );
        var e;
    }
    function ki(t, e) {
        var i,
            r,
            n = t.__data__;
        return ("string" == (r = typeof (i = e)) || "number" == r || "symbol" == r || "boolean" == r ? "__proto__" !== i : null === i) ? n["string" == typeof e ? "string" : "hash"] : n.map;
    }
    function Wi(t, e) {
        var i = (function (t, e) {
            return null == t ? void 0 : t[e];
        })(t, e);
        return Mi(i) ? i : void 0;
    }
    function Ti(t, e) {
        if ("function" != typeof t || (e && "function" != typeof e)) throw new TypeError(ni);
        var i = function () {
            var r = arguments,
                n = e ? e.apply(this, r) : r[0],
                s = i.cache;
            if (s.has(n)) return s.get(n);
            var o = t.apply(this, r);
            return (i.cache = s.set(n, o)), o;
        };
        return (i.cache = new (Ti.Cache || Li)()), i;
    }
    function Ri(t) {
        var e = typeof t;
        return !!t && ("object" == e || "function" == e);
    }
    (_i.prototype.clear = function () {
        this.__data__ = Oi ? Oi(null) : {};
    }),
        (_i.prototype.delete = function (t) {
            return this.has(t) && delete this.__data__[t];
        }),
        (_i.prototype.get = function (t) {
            var e = this.__data__;
            if (Oi) {
                var i = e[t];
                return i === si ? void 0 : i;
            }
            return mi.call(e, t) ? e[t] : void 0;
        }),
        (_i.prototype.has = function (t) {
            var e = this.__data__;
            return Oi ? void 0 !== e[t] : mi.call(e, t);
        }),
        (_i.prototype.set = function (t, e) {
            return (this.__data__[t] = Oi && void 0 === e ? si : e), this;
        }),
        (Si.prototype.clear = function () {
            this.__data__ = [];
        }),
        (Si.prototype.delete = function (t) {
            var e = this.__data__,
                i = Ai(e, t);
            return !(i < 0 || (i == e.length - 1 ? e.pop() : Ei.call(e, i, 1), 0));
        }),
        (Si.prototype.get = function (t) {
            var e = this.__data__,
                i = Ai(e, t);
            return i < 0 ? void 0 : e[i][1];
        }),
        (Si.prototype.has = function (t) {
            return Ai(this.__data__, t) > -1;
        }),
        (Si.prototype.set = function (t, e) {
            var i = this.__data__,
                r = Ai(i, t);
            return r < 0 ? i.push([t, e]) : (i[r][1] = e), this;
        }),
        (Li.prototype.clear = function () {
            this.__data__ = { hash: new _i(), map: new (wi || Si)(), string: new _i() };
        }),
        (Li.prototype.delete = function (t) {
            return ki(this, t).delete(t);
        }),
        (Li.prototype.get = function (t) {
            return ki(this, t).get(t);
        }),
        (Li.prototype.has = function (t) {
            return ki(this, t).has(t);
        }),
        (Li.prototype.set = function (t, e) {
            return ki(this, t).set(t, e), this;
        }),
        (Ti.Cache = Li);
    var ji = Ti,
        Ci = (function () {
            if ("undefined" != typeof Map) return Map;
            function t(t, e) {
                var i = -1;
                return (
                    t.some(function (t, r) {
                        return t[0] === e && ((i = r), !0);
                    }),
                    i
                );
            }
            return (function () {
                function e() {
                    this.__entries__ = [];
                }
                return (
                    Object.defineProperty(e.prototype, "size", {
                        get: function () {
                            return this.__entries__.length;
                        },
                        enumerable: !0,
                        configurable: !0,
                    }),
                    (e.prototype.get = function (e) {
                        var i = t(this.__entries__, e),
                            r = this.__entries__[i];
                        return r && r[1];
                    }),
                    (e.prototype.set = function (e, i) {
                        var r = t(this.__entries__, e);
                        ~r ? (this.__entries__[r][1] = i) : this.__entries__.push([e, i]);
                    }),
                    (e.prototype.delete = function (e) {
                        var i = this.__entries__,
                            r = t(i, e);
                        ~r && i.splice(r, 1);
                    }),
                    (e.prototype.has = function (e) {
                        return !!~t(this.__entries__, e);
                    }),
                    (e.prototype.clear = function () {
                        this.__entries__.splice(0);
                    }),
                    (e.prototype.forEach = function (t, e) {
                        void 0 === e && (e = null);
                        for (var i = 0, r = this.__entries__; i < r.length; i++) {
                            var n = r[i];
                            t.call(e, n[1], n[0]);
                        }
                    }),
                    e
                );
            })();
        })(),
        Ni = "undefined" != typeof window && "undefined" != typeof document && window.document === document,
        zi = "undefined" != typeof global && global.Math === Math ? global : "undefined" != typeof self && self.Math === Math ? self : "undefined" != typeof window && window.Math === Math ? window : Function("return this")(),
        Di =
            "function" == typeof requestAnimationFrame
                ? requestAnimationFrame.bind(zi)
                : function (t) {
                      return setTimeout(function () {
                          return t(Date.now());
                      }, 1e3 / 60);
                  },
        Vi = 2;
    var Ii = 20,
        Bi = ["top", "right", "bottom", "left", "width", "height", "size", "weight"],
        Pi = "undefined" != typeof MutationObserver,
        Hi = (function () {
            function t() {
                (this.connected_ = !1),
                    (this.mutationEventsAdded_ = !1),
                    (this.mutationsObserver_ = null),
                    (this.observers_ = []),
                    (this.onTransitionEnd_ = this.onTransitionEnd_.bind(this)),
                    (this.refresh = (function (t, e) {
                        var i = !1,
                            r = !1,
                            n = 0;
                        function s() {
                            i && ((i = !1), t()), r && a();
                        }
                        function o() {
                            Di(s);
                        }
                        function a() {
                            var t = Date.now();
                            if (i) {
                                if (t - n < Vi) return;
                                r = !0;
                            } else (i = !0), (r = !1), setTimeout(o, e);
                            n = t;
                        }
                        return a;
                    })(this.refresh.bind(this), Ii));
            }
            return (
                (t.prototype.addObserver = function (t) {
                    ~this.observers_.indexOf(t) || this.observers_.push(t), this.connected_ || this.connect_();
                }),
                (t.prototype.removeObserver = function (t) {
                    var e = this.observers_,
                        i = e.indexOf(t);
                    ~i && e.splice(i, 1), !e.length && this.connected_ && this.disconnect_();
                }),
                (t.prototype.refresh = function () {
                    this.updateObservers_() && this.refresh();
                }),
                (t.prototype.updateObservers_ = function () {
                    var t = this.observers_.filter(function (t) {
                        return t.gatherActive(), t.hasActive();
                    });
                    return (
                        t.forEach(function (t) {
                            return t.broadcastActive();
                        }),
                        t.length > 0
                    );
                }),
                (t.prototype.connect_ = function () {
                    Ni &&
                        !this.connected_ &&
                        (document.addEventListener("transitionend", this.onTransitionEnd_),
                        window.addEventListener("resize", this.refresh),
                        Pi
                            ? ((this.mutationsObserver_ = new MutationObserver(this.refresh)), this.mutationsObserver_.observe(document, { attributes: !0, childList: !0, characterData: !0, subtree: !0 }))
                            : (document.addEventListener("DOMSubtreeModified", this.refresh), (this.mutationEventsAdded_ = !0)),
                        (this.connected_ = !0));
                }),
                (t.prototype.disconnect_ = function () {
                    Ni &&
                        this.connected_ &&
                        (document.removeEventListener("transitionend", this.onTransitionEnd_),
                        window.removeEventListener("resize", this.refresh),
                        this.mutationsObserver_ && this.mutationsObserver_.disconnect(),
                        this.mutationEventsAdded_ && document.removeEventListener("DOMSubtreeModified", this.refresh),
                        (this.mutationsObserver_ = null),
                        (this.mutationEventsAdded_ = !1),
                        (this.connected_ = !1));
                }),
                (t.prototype.onTransitionEnd_ = function (t) {
                    var e = t.propertyName,
                        i = void 0 === e ? "" : e;
                    Bi.some(function (t) {
                        return !!~i.indexOf(t);
                    }) && this.refresh();
                }),
                (t.getInstance = function () {
                    return this.instance_ || (this.instance_ = new t()), this.instance_;
                }),
                (t.instance_ = null),
                t
            );
        })(),
        Fi = function (t, e) {
            for (var i = 0, r = Object.keys(e); i < r.length; i++) {
                var n = r[i];
                Object.defineProperty(t, n, { value: e[n], enumerable: !1, writable: !1, configurable: !0 });
            }
            return t;
        },
        qi = function (t) {
            return (t && t.ownerDocument && t.ownerDocument.defaultView) || zi;
        },
        $i = Ji(0, 0, 0, 0);
    function Yi(t) {
        return parseFloat(t) || 0;
    }
    function Xi(t) {
        for (var e = [], i = 1; i < arguments.length; i++) e[i - 1] = arguments[i];
        return e.reduce(function (e, i) {
            return e + Yi(t["border-" + i + "-width"]);
        }, 0);
    }
    function Gi(t) {
        var e = t.clientWidth,
            i = t.clientHeight;
        if (!e && !i) return $i;
        var r = qi(t).getComputedStyle(t),
            n = (function (t) {
                for (var e = {}, i = 0, r = ["top", "right", "bottom", "left"]; i < r.length; i++) {
                    var n = r[i],
                        s = t["padding-" + n];
                    e[n] = Yi(s);
                }
                return e;
            })(r),
            s = n.left + n.right,
            o = n.top + n.bottom,
            a = Yi(r.width),
            l = Yi(r.height);
        if (
            ("border-box" === r.boxSizing && (Math.round(a + s) !== e && (a -= Xi(r, "left", "right") + s), Math.round(l + o) !== i && (l -= Xi(r, "top", "bottom") + o)),
            !(function (t) {
                return t === qi(t).document.documentElement;
            })(t))
        ) {
            var c = Math.round(a + s) - e,
                u = Math.round(l + o) - i;
            1 !== Math.abs(c) && (a -= c), 1 !== Math.abs(u) && (l -= u);
        }
        return Ji(n.left, n.top, a, l);
    }
    var Ki =
        "undefined" != typeof SVGGraphicsElement
            ? function (t) {
                  return t instanceof qi(t).SVGGraphicsElement;
              }
            : function (t) {
                  return t instanceof qi(t).SVGElement && "function" == typeof t.getBBox;
              };
    function Ui(t) {
        return Ni
            ? Ki(t)
                ? (function (t) {
                      var e = t.getBBox();
                      return Ji(0, 0, e.width, e.height);
                  })(t)
                : Gi(t)
            : $i;
    }
    function Ji(t, e, i, r) {
        return { x: t, y: e, width: i, height: r };
    }
    var Qi = (function () {
            function t(t) {
                (this.broadcastWidth = 0), (this.broadcastHeight = 0), (this.contentRect_ = Ji(0, 0, 0, 0)), (this.target = t);
            }
            return (
                (t.prototype.isActive = function () {
                    var t = Ui(this.target);
                    return (this.contentRect_ = t), t.width !== this.broadcastWidth || t.height !== this.broadcastHeight;
                }),
                (t.prototype.broadcastRect = function () {
                    var t = this.contentRect_;
                    return (this.broadcastWidth = t.width), (this.broadcastHeight = t.height), t;
                }),
                t
            );
        })(),
        Zi = (function () {
            return function (t, e) {
                var i,
                    r,
                    n,
                    s,
                    o,
                    a,
                    l,
                    c =
                        ((r = (i = e).x),
                        (n = i.y),
                        (s = i.width),
                        (o = i.height),
                        (a = "undefined" != typeof DOMRectReadOnly ? DOMRectReadOnly : Object),
                        (l = Object.create(a.prototype)),
                        Fi(l, { x: r, y: n, width: s, height: o, top: n, right: r + s, bottom: o + n, left: r }),
                        l);
                Fi(this, { target: t, contentRect: c });
            };
        })(),
        tr = (function () {
            function t(t, e, i) {
                if (((this.activeObservations_ = []), (this.observations_ = new Ci()), "function" != typeof t)) throw new TypeError("The callback provided as parameter 1 is not a function.");
                (this.callback_ = t), (this.controller_ = e), (this.callbackCtx_ = i);
            }
            return (
                (t.prototype.observe = function (t) {
                    if (!arguments.length) throw new TypeError("1 argument required, but only 0 present.");
                    if ("undefined" != typeof Element && Element instanceof Object) {
                        if (!(t instanceof qi(t).Element)) throw new TypeError('parameter 1 is not of type "Element".');
                        var e = this.observations_;
                        e.has(t) || (e.set(t, new Qi(t)), this.controller_.addObserver(this), this.controller_.refresh());
                    }
                }),
                (t.prototype.unobserve = function (t) {
                    if (!arguments.length) throw new TypeError("1 argument required, but only 0 present.");
                    if ("undefined" != typeof Element && Element instanceof Object) {
                        if (!(t instanceof qi(t).Element)) throw new TypeError('parameter 1 is not of type "Element".');
                        var e = this.observations_;
                        e.has(t) && (e.delete(t), e.size || this.controller_.removeObserver(this));
                    }
                }),
                (t.prototype.disconnect = function () {
                    this.clearActive(), this.observations_.clear(), this.controller_.removeObserver(this);
                }),
                (t.prototype.gatherActive = function () {
                    var t = this;
                    this.clearActive(),
                        this.observations_.forEach(function (e) {
                            e.isActive() && t.activeObservations_.push(e);
                        });
                }),
                (t.prototype.broadcastActive = function () {
                    if (this.hasActive()) {
                        var t = this.callbackCtx_,
                            e = this.activeObservations_.map(function (t) {
                                return new Zi(t.target, t.broadcastRect());
                            });
                        this.callback_.call(t, e, t), this.clearActive();
                    }
                }),
                (t.prototype.clearActive = function () {
                    this.activeObservations_.splice(0);
                }),
                (t.prototype.hasActive = function () {
                    return this.activeObservations_.length > 0;
                }),
                t
            );
        })(),
        er = "undefined" != typeof WeakMap ? new WeakMap() : new Ci(),
        ir = (function () {
            return function t(e) {
                if (!(this instanceof t)) throw new TypeError("Cannot call a class as a function.");
                if (!arguments.length) throw new TypeError("1 argument required, but only 0 present.");
                var i = Hi.getInstance(),
                    r = new tr(e, i, this);
                er.set(this, r);
            };
        })();
    ["observe", "unobserve", "disconnect"].forEach(function (t) {
        ir.prototype[t] = function () {
            var e;
            return (e = er.get(this))[t].apply(e, arguments);
        };
    });
    var rr = void 0 !== zi.ResizeObserver ? zi.ResizeObserver : ir,
        nr = !("undefined" == typeof window || !window.document || !window.document.createElement);
    function sr() {
        if ("undefined" == typeof document) return 0;
        var t = document.body,
            e = document.createElement("div"),
            i = e.style;
        (i.position = "fixed"), (i.left = 0), (i.visibility = "hidden"), (i.overflowY = "scroll"), t.appendChild(e);
        var r = e.getBoundingClientRect().right;
        return t.removeChild(e), r;
    }
    var or = (function () {
        function t(e, i) {
            var r = this;
            (this.onScroll = function () {
                r.scrollXTicking || (window.requestAnimationFrame(r.scrollX), (r.scrollXTicking = !0)), r.scrollYTicking || (window.requestAnimationFrame(r.scrollY), (r.scrollYTicking = !0));
            }),
                (this.scrollX = function () {
                    r.axis.x.isOverflowing && (r.showScrollbar("x"), r.positionScrollbar("x")), (r.scrollXTicking = !1);
                }),
                (this.scrollY = function () {
                    r.axis.y.isOverflowing && (r.showScrollbar("y"), r.positionScrollbar("y")), (r.scrollYTicking = !1);
                }),
                (this.onMouseEnter = function () {
                    r.showScrollbar("x"), r.showScrollbar("y");
                }),
                (this.onMouseMove = function (t) {
                    (r.mouseX = t.clientX), (r.mouseY = t.clientY), (r.axis.x.isOverflowing || r.axis.x.forceVisible) && r.onMouseMoveForAxis("x"), (r.axis.y.isOverflowing || r.axis.y.forceVisible) && r.onMouseMoveForAxis("y");
                }),
                (this.onMouseLeave = function () {
                    r.onMouseMove.cancel(), (r.axis.x.isOverflowing || r.axis.x.forceVisible) && r.onMouseLeaveForAxis("x"), (r.axis.y.isOverflowing || r.axis.y.forceVisible) && r.onMouseLeaveForAxis("y"), (r.mouseX = -1), (r.mouseY = -1);
                }),
                (this.onWindowResize = function () {
                    (r.scrollbarWidth = sr()), r.hideNativeScrollbar();
                }),
                (this.hideScrollbars = function () {
                    (r.axis.x.track.rect = r.axis.x.track.el.getBoundingClientRect()),
                        (r.axis.y.track.rect = r.axis.y.track.el.getBoundingClientRect()),
                        r.isWithinBounds(r.axis.y.track.rect) || (r.axis.y.scrollbar.el.classList.remove(r.classNames.visible), (r.axis.y.isVisible = !1)),
                        r.isWithinBounds(r.axis.x.track.rect) || (r.axis.x.scrollbar.el.classList.remove(r.classNames.visible), (r.axis.x.isVisible = !1));
                }),
                (this.onPointerEvent = function (t) {
                    var e, i;
                    (r.axis.x.scrollbar.rect = r.axis.x.scrollbar.el.getBoundingClientRect()),
                        (r.axis.y.scrollbar.rect = r.axis.y.scrollbar.el.getBoundingClientRect()),
                        (r.axis.x.isOverflowing || r.axis.x.forceVisible) && (i = r.isWithinBounds(r.axis.x.scrollbar.rect)),
                        (r.axis.y.isOverflowing || r.axis.y.forceVisible) && (e = r.isWithinBounds(r.axis.y.scrollbar.rect)),
                        (e || i) && (t.preventDefault(), t.stopPropagation(), "mousedown" === t.type && (e && r.onDragStart(t, "y"), i && r.onDragStart(t, "x")));
                }),
                (this.drag = function (e) {
                    var i = r.axis[r.draggedAxis].track,
                        n = i.rect[r.axis[r.draggedAxis].sizeAttr],
                        s = r.axis[r.draggedAxis].scrollbar,
                        o = r.contentWrapperEl[r.axis[r.draggedAxis].scrollSizeAttr],
                        a = parseInt(r.elStyles[r.axis[r.draggedAxis].sizeAttr], 10);
                    e.preventDefault(), e.stopPropagation();
                    var l = ((("y" === r.draggedAxis ? e.pageY : e.pageX) - i.rect[r.axis[r.draggedAxis].offsetAttr] - r.axis[r.draggedAxis].dragOffset) / (n - s.size)) * (o - a);
                    "x" === r.draggedAxis && ((l = r.isRtl && t.getRtlHelpers().isRtlScrollbarInverted ? l - (n + s.size) : l), (l = r.isRtl && t.getRtlHelpers().isRtlScrollingInverted ? -l : l)),
                        (r.contentWrapperEl[r.axis[r.draggedAxis].scrollOffsetAttr] = l);
                }),
                (this.onEndDrag = function (t) {
                    t.preventDefault(),
                        t.stopPropagation(),
                        r.el.classList.remove(r.classNames.dragging),
                        document.removeEventListener("mousemove", r.drag, !0),
                        document.removeEventListener("mouseup", r.onEndDrag, !0),
                        (r.removePreventClickId = window.setTimeout(function () {
                            document.removeEventListener("click", r.preventClick, !0), document.removeEventListener("dblclick", r.preventClick, !0), (r.removePreventClickId = null);
                        }));
                }),
                (this.preventClick = function (t) {
                    t.preventDefault(), t.stopPropagation();
                }),
                (this.el = e),
                this.flashTimeout,
                this.contentEl,
                this.contentWrapperEl,
                this.offsetEl,
                this.maskEl,
                this.globalObserver,
                this.mutationObserver,
                this.resizeObserver,
                this.scrollbarWidth,
                (this.minScrollbarWidth = 20),
                (this.options = Object.assign({}, t.defaultOptions, i)),
                (this.classNames = Object.assign({}, t.defaultOptions.classNames, this.options.classNames)),
                this.isRtl,
                (this.axis = {
                    x: {
                        scrollOffsetAttr: "scrollLeft",
                        sizeAttr: "width",
                        scrollSizeAttr: "scrollWidth",
                        offsetAttr: "left",
                        overflowAttr: "overflowX",
                        dragOffset: 0,
                        isOverflowing: !0,
                        isVisible: !1,
                        forceVisible: !1,
                        track: {},
                        scrollbar: {},
                    },
                    y: {
                        scrollOffsetAttr: "scrollTop",
                        sizeAttr: "height",
                        scrollSizeAttr: "scrollHeight",
                        offsetAttr: "top",
                        overflowAttr: "overflowY",
                        dragOffset: 0,
                        isOverflowing: !0,
                        isVisible: !1,
                        forceVisible: !1,
                        track: {},
                        scrollbar: {},
                    },
                }),
                (this.removePreventClickId = null),
                this.el.SimpleBar ||
                    ((this.recalculate = Ie(this.recalculate.bind(this), 64)),
                    (this.onMouseMove = Ie(this.onMouseMove.bind(this), 64)),
                    (this.hideScrollbars = ri(this.hideScrollbars.bind(this), this.options.timeout)),
                    (this.onWindowResize = ri(this.onWindowResize.bind(this), 64, { leading: !0 })),
                    (t.getRtlHelpers = ji(t.getRtlHelpers)),
                    this.init());
        }
        (t.getRtlHelpers = function () {
            var e = document.createElement("div");
            e.innerHTML = '<div class="hs-dummy-scrollbar-size"><div style="height: 200%; width: 200%; margin: 10px 0;"></div></div>';
            var i = e.firstElementChild;
            document.body.appendChild(i);
            var r = i.firstElementChild;
            i.scrollLeft = 0;
            var n = t.getOffset(i),
                s = t.getOffset(r);
            i.scrollLeft = 999;
            var o = t.getOffset(r);
            return { isRtlScrollingInverted: n.left !== s.left && s.left - o.left != 0, isRtlScrollbarInverted: n.left !== s.left };
        }),
            (t.initHtmlApi = function () {
                (this.initDOMLoadedElements = this.initDOMLoadedElements.bind(this)),
                    "undefined" != typeof MutationObserver &&
                        ((this.globalObserver = new MutationObserver(function (e) {
                            e.forEach(function (e) {
                                Array.prototype.forEach.call(e.addedNodes, function (e) {
                                    1 === e.nodeType &&
                                        (e.hasAttribute("data-simplebar")
                                            ? !e.SimpleBar && new t(e, t.getElOptions(e))
                                            : Array.prototype.forEach.call(e.querySelectorAll("[data-simplebar]"), function (e) {
                                                  !e.SimpleBar && new t(e, t.getElOptions(e));
                                              }));
                                }),
                                    Array.prototype.forEach.call(e.removedNodes, function (t) {
                                        1 === t.nodeType &&
                                            (t.hasAttribute("data-simplebar")
                                                ? t.SimpleBar && t.SimpleBar.unMount()
                                                : Array.prototype.forEach.call(t.querySelectorAll("[data-simplebar]"), function (t) {
                                                      t.SimpleBar && t.SimpleBar.unMount();
                                                  }));
                                    });
                            });
                        })),
                        this.globalObserver.observe(document, { childList: !0, subtree: !0 })),
                    "complete" === document.readyState || ("loading" !== document.readyState && !document.documentElement.doScroll)
                        ? window.setTimeout(this.initDOMLoadedElements)
                        : (document.addEventListener("DOMContentLoaded", this.initDOMLoadedElements), window.addEventListener("load", this.initDOMLoadedElements));
            }),
            (t.getElOptions = function (t) {
                return Array.prototype.reduce.call(
                    t.attributes,
                    function (t, e) {
                        var i = e.name.match(/data-simplebar-(.+)/);
                        if (i) {
                            var r = i[1].replace(/\W+(.)/g, function (t, e) {
                                return e.toUpperCase();
                            });
                            switch (e.value) {
                                case "true":
                                    t[r] = !0;
                                    break;
                                case "false":
                                    t[r] = !1;
                                    break;
                                case void 0:
                                    t[r] = !0;
                                    break;
                                default:
                                    t[r] = e.value;
                            }
                        }
                        return t;
                    },
                    {}
                );
            }),
            (t.removeObserver = function () {
                this.globalObserver.disconnect();
            }),
            (t.initDOMLoadedElements = function () {
                document.removeEventListener("DOMContentLoaded", this.initDOMLoadedElements),
                    window.removeEventListener("load", this.initDOMLoadedElements),
                    Array.prototype.forEach.call(document.querySelectorAll("[data-simplebar]"), function (e) {
                        e.SimpleBar || new t(e, t.getElOptions(e));
                    });
            }),
            (t.getOffset = function (t) {
                var e = t.getBoundingClientRect();
                return { top: e.top + (window.pageYOffset || document.documentElement.scrollTop), left: e.left + (window.pageXOffset || document.documentElement.scrollLeft) };
            });
        var e = t.prototype;
        return (
            (e.init = function () {
                (this.el.SimpleBar = this), nr && (this.initDOM(), (this.scrollbarWidth = sr()), this.recalculate(), this.initListeners());
            }),
            (e.initDOM = function () {
                var t = this;
                if (
                    Array.prototype.filter.call(this.el.children, function (e) {
                        return e.classList.contains(t.classNames.wrapper);
                    }).length
                )
                    (this.wrapperEl = this.el.querySelector("." + this.classNames.wrapper)),
                        (this.contentWrapperEl = this.el.querySelector("." + this.classNames.contentWrapper)),
                        (this.offsetEl = this.el.querySelector("." + this.classNames.offset)),
                        (this.maskEl = this.el.querySelector("." + this.classNames.mask)),
                        (this.contentEl = this.el.querySelector("." + this.classNames.contentEl)),
                        (this.placeholderEl = this.el.querySelector("." + this.classNames.placeholder)),
                        (this.heightAutoObserverWrapperEl = this.el.querySelector("." + this.classNames.heightAutoObserverWrapperEl)),
                        (this.heightAutoObserverEl = this.el.querySelector("." + this.classNames.heightAutoObserverEl)),
                        (this.axis.x.track.el = this.findChild(this.el, "." + this.classNames.track + "." + this.classNames.horizontal)),
                        (this.axis.y.track.el = this.findChild(this.el, "." + this.classNames.track + "." + this.classNames.vertical));
                else {
                    for (
                        this.wrapperEl = document.createElement("div"),
                            this.contentWrapperEl = document.createElement("div"),
                            this.offsetEl = document.createElement("div"),
                            this.maskEl = document.createElement("div"),
                            this.contentEl = document.createElement("div"),
                            this.placeholderEl = document.createElement("div"),
                            this.heightAutoObserverWrapperEl = document.createElement("div"),
                            this.heightAutoObserverEl = document.createElement("div"),
                            this.wrapperEl.classList.add(this.classNames.wrapper),
                            this.contentWrapperEl.classList.add(this.classNames.contentWrapper),
                            this.offsetEl.classList.add(this.classNames.offset),
                            this.maskEl.classList.add(this.classNames.mask),
                            this.contentEl.classList.add(this.classNames.contentEl),
                            this.placeholderEl.classList.add(this.classNames.placeholder),
                            this.heightAutoObserverWrapperEl.classList.add(this.classNames.heightAutoObserverWrapperEl),
                            this.heightAutoObserverEl.classList.add(this.classNames.heightAutoObserverEl);
                        this.el.firstChild;

                    )
                        this.contentEl.appendChild(this.el.firstChild);
                    this.contentWrapperEl.appendChild(this.contentEl),
                        this.offsetEl.appendChild(this.contentWrapperEl),
                        this.maskEl.appendChild(this.offsetEl),
                        this.heightAutoObserverWrapperEl.appendChild(this.heightAutoObserverEl),
                        this.wrapperEl.appendChild(this.heightAutoObserverWrapperEl),
                        this.wrapperEl.appendChild(this.maskEl),
                        this.wrapperEl.appendChild(this.placeholderEl),
                        this.el.appendChild(this.wrapperEl);
                }
                if (!this.axis.x.track.el || !this.axis.y.track.el) {
                    var e = document.createElement("div"),
                        i = document.createElement("div");
                    e.classList.add(this.classNames.track),
                        i.classList.add(this.classNames.scrollbar),
                        e.appendChild(i),
                        (this.axis.x.track.el = e.cloneNode(!0)),
                        this.axis.x.track.el.classList.add(this.classNames.horizontal),
                        (this.axis.y.track.el = e.cloneNode(!0)),
                        this.axis.y.track.el.classList.add(this.classNames.vertical),
                        this.el.appendChild(this.axis.x.track.el),
                        this.el.appendChild(this.axis.y.track.el);
                }
                (this.axis.x.scrollbar.el = this.axis.x.track.el.querySelector("." + this.classNames.scrollbar)),
                    (this.axis.y.scrollbar.el = this.axis.y.track.el.querySelector("." + this.classNames.scrollbar)),
                    this.options.autoHide || (this.axis.x.scrollbar.el.classList.add(this.classNames.visible), this.axis.y.scrollbar.el.classList.add(this.classNames.visible)),
                    this.el.setAttribute("data-simplebar", "init");
            }),
            (e.initListeners = function () {
                var t = this;
                this.options.autoHide && this.el.addEventListener("mouseenter", this.onMouseEnter),
                    ["mousedown", "click", "dblclick"].forEach(function (e) {
                        t.el.addEventListener(e, t.onPointerEvent, !0);
                    }),
                    ["touchstart", "touchend", "touchmove"].forEach(function (e) {
                        t.el.addEventListener(e, t.onPointerEvent, { capture: !0, passive: !0 });
                    }),
                    this.el.addEventListener("mousemove", this.onMouseMove),
                    this.el.addEventListener("mouseleave", this.onMouseLeave),
                    this.contentWrapperEl.addEventListener("scroll", this.onScroll),
                    window.addEventListener("resize", this.onWindowResize),
                    (this.resizeObserver = new rr(this.recalculate)),
                    this.resizeObserver.observe(this.el),
                    this.resizeObserver.observe(this.contentEl);
            }),
            (e.recalculate = function () {
                var t = this.heightAutoObserverEl.offsetHeight <= 1,
                    e = this.heightAutoObserverEl.offsetWidth <= 1;
                (this.elStyles = window.getComputedStyle(this.el)),
                    (this.isRtl = "rtl" === this.elStyles.direction),
                    (this.contentEl.style.padding = this.elStyles.paddingTop + " " + this.elStyles.paddingRight + " " + this.elStyles.paddingBottom + " " + this.elStyles.paddingLeft),
                    (this.wrapperEl.style.margin = "-" + this.elStyles.paddingTop + " -" + this.elStyles.paddingRight + " -" + this.elStyles.paddingBottom + " -" + this.elStyles.paddingLeft),
                    (this.contentWrapperEl.style.height = t ? "auto" : "100%"),
                    (this.placeholderEl.style.width = e ? this.contentEl.offsetWidth + "px" : "auto"),
                    (this.placeholderEl.style.height = this.contentEl.scrollHeight + "px"),
                    (this.axis.x.isOverflowing = this.contentWrapperEl.scrollWidth > this.contentWrapperEl.offsetWidth),
                    (this.axis.y.isOverflowing = this.contentWrapperEl.scrollHeight > this.contentWrapperEl.offsetHeight),
                    (this.axis.x.isOverflowing = "hidden" !== this.elStyles.overflowX && this.axis.x.isOverflowing),
                    (this.axis.y.isOverflowing = "hidden" !== this.elStyles.overflowY && this.axis.y.isOverflowing),
                    (this.axis.x.forceVisible = "x" === this.options.forceVisible || !0 === this.options.forceVisible),
                    (this.axis.y.forceVisible = "y" === this.options.forceVisible || !0 === this.options.forceVisible),
                    this.hideNativeScrollbar(),
                    (this.axis.x.track.rect = this.axis.x.track.el.getBoundingClientRect()),
                    (this.axis.y.track.rect = this.axis.y.track.el.getBoundingClientRect()),
                    (this.axis.x.scrollbar.size = this.getScrollbarSize("x")),
                    (this.axis.y.scrollbar.size = this.getScrollbarSize("y")),
                    (this.axis.x.scrollbar.el.style.width = this.axis.x.scrollbar.size + "px"),
                    (this.axis.y.scrollbar.el.style.height = this.axis.y.scrollbar.size + "px"),
                    this.positionScrollbar("x"),
                    this.positionScrollbar("y"),
                    this.toggleTrackVisibility("x"),
                    this.toggleTrackVisibility("y");
            }),
            (e.getScrollbarSize = function (t) {
                void 0 === t && (t = "y");
                var e,
                    i = this.scrollbarWidth ? this.contentWrapperEl[this.axis[t].scrollSizeAttr] : this.contentWrapperEl[this.axis[t].scrollSizeAttr] - this.minScrollbarWidth,
                    r = this.axis[t].track.rect[this.axis[t].sizeAttr];
                if (this.axis[t].isOverflowing) {
                    var n = r / i;
                    return (e = Math.max(~~(n * r), this.options.scrollbarMinSize)), this.options.scrollbarMaxSize && (e = Math.min(e, this.options.scrollbarMaxSize)), e;
                }
            }),
            (e.positionScrollbar = function (e) {
                void 0 === e && (e = "y");
                var i = this.contentWrapperEl[this.axis[e].scrollSizeAttr],
                    r = this.axis[e].track.rect[this.axis[e].sizeAttr],
                    n = parseInt(this.elStyles[this.axis[e].sizeAttr], 10),
                    s = this.axis[e].scrollbar,
                    o = this.contentWrapperEl[this.axis[e].scrollOffsetAttr],
                    a = (o = "x" === e && this.isRtl && t.getRtlHelpers().isRtlScrollingInverted ? -o : o) / (i - n),
                    l = ~~((r - s.size) * a);
                (l = "x" === e && this.isRtl && t.getRtlHelpers().isRtlScrollbarInverted ? l + (r - s.size) : l), (s.el.style.transform = "x" === e ? "translate3d(" + l + "px, 0, 0)" : "translate3d(0, " + l + "px, 0)");
            }),
            (e.toggleTrackVisibility = function (t) {
                void 0 === t && (t = "y");
                var e = this.axis[t].track.el,
                    i = this.axis[t].scrollbar.el;
                this.axis[t].isOverflowing || this.axis[t].forceVisible
                    ? ((e.style.visibility = "visible"), (this.contentWrapperEl.style[this.axis[t].overflowAttr] = "scroll"))
                    : ((e.style.visibility = "hidden"), (this.contentWrapperEl.style[this.axis[t].overflowAttr] = "hidden")),
                    this.axis[t].isOverflowing ? (i.style.display = "block") : (i.style.display = "none");
            }),
            (e.hideNativeScrollbar = function () {
                if (
                    ((this.offsetEl.style[this.isRtl ? "left" : "right"] = this.axis.y.isOverflowing || this.axis.y.forceVisible ? "-" + (this.scrollbarWidth || this.minScrollbarWidth) + "px" : 0),
                    (this.offsetEl.style.bottom = this.axis.x.isOverflowing || this.axis.x.forceVisible ? "-" + (this.scrollbarWidth || this.minScrollbarWidth) + "px" : 0),
                    !this.scrollbarWidth)
                ) {
                    var t = [this.isRtl ? "paddingLeft" : "paddingRight"];
                    (this.contentWrapperEl.style[t] = this.axis.y.isOverflowing || this.axis.y.forceVisible ? this.minScrollbarWidth + "px" : 0),
                        (this.contentWrapperEl.style.paddingBottom = this.axis.x.isOverflowing || this.axis.x.forceVisible ? this.minScrollbarWidth + "px" : 0);
                }
            }),
            (e.onMouseMoveForAxis = function (t) {
                void 0 === t && (t = "y"),
                    (this.axis[t].track.rect = this.axis[t].track.el.getBoundingClientRect()),
                    (this.axis[t].scrollbar.rect = this.axis[t].scrollbar.el.getBoundingClientRect()),
                    this.isWithinBounds(this.axis[t].scrollbar.rect) ? this.axis[t].scrollbar.el.classList.add(this.classNames.hover) : this.axis[t].scrollbar.el.classList.remove(this.classNames.hover),
                    this.isWithinBounds(this.axis[t].track.rect) ? (this.showScrollbar(t), this.axis[t].track.el.classList.add(this.classNames.hover)) : this.axis[t].track.el.classList.remove(this.classNames.hover);
            }),
            (e.onMouseLeaveForAxis = function (t) {
                void 0 === t && (t = "y"), this.axis[t].track.el.classList.remove(this.classNames.hover), this.axis[t].scrollbar.el.classList.remove(this.classNames.hover);
            }),
            (e.showScrollbar = function (t) {
                void 0 === t && (t = "y");
                var e = this.axis[t].scrollbar.el;
                this.axis[t].isVisible || (e.classList.add(this.classNames.visible), (this.axis[t].isVisible = !0)), this.options.autoHide && this.hideScrollbars();
            }),
            (e.onDragStart = function (t, e) {
                void 0 === e && (e = "y");
                var i = this.axis[e].scrollbar.el,
                    r = "y" === e ? t.pageY : t.pageX;
                (this.axis[e].dragOffset = r - i.getBoundingClientRect()[this.axis[e].offsetAttr]),
                    (this.draggedAxis = e),
                    this.el.classList.add(this.classNames.dragging),
                    document.addEventListener("mousemove", this.drag, !0),
                    document.addEventListener("mouseup", this.onEndDrag, !0),
                    null === this.removePreventClickId
                        ? (document.addEventListener("click", this.preventClick, !0), document.addEventListener("dblclick", this.preventClick, !0))
                        : (window.clearTimeout(this.removePreventClickId), (this.removePreventClickId = null));
            }),
            (e.getContentElement = function () {
                return this.contentEl;
            }),
            (e.getScrollElement = function () {
                return this.contentWrapperEl;
            }),
            (e.removeListeners = function () {
                var t = this;
                this.options.autoHide && this.el.removeEventListener("mouseenter", this.onMouseEnter),
                    ["mousedown", "click", "dblclick"].forEach(function (e) {
                        t.el.removeEventListener(e, t.onPointerEvent, !0);
                    }),
                    ["touchstart", "touchend", "touchmove"].forEach(function (e) {
                        t.el.removeEventListener(e, t.onPointerEvent, { capture: !0, passive: !0 });
                    }),
                    this.el.removeEventListener("mousemove", this.onMouseMove),
                    this.el.removeEventListener("mouseleave", this.onMouseLeave),
                    this.contentWrapperEl.removeEventListener("scroll", this.onScroll),
                    window.removeEventListener("resize", this.onWindowResize),
                    this.mutationObserver && this.mutationObserver.disconnect(),
                    this.resizeObserver.disconnect(),
                    this.recalculate.cancel(),
                    this.onMouseMove.cancel(),
                    this.hideScrollbars.cancel(),
                    this.onWindowResize.cancel();
            }),
            (e.unMount = function () {
                this.removeListeners(), (this.el.SimpleBar = null);
            }),
            (e.isChildNode = function (t) {
                return null !== t && (t === this.el || this.isChildNode(t.parentNode));
            }),
            (e.isWithinBounds = function (t) {
                return this.mouseX >= t.left && this.mouseX <= t.left + t.width && this.mouseY >= t.top && this.mouseY <= t.top + t.height;
            }),
            (e.findChild = function (t, e) {
                var i = t.matches || t.webkitMatchesSelector || t.mozMatchesSelector || t.msMatchesSelector;
                return Array.prototype.filter.call(t.children, function (t) {
                    return i.call(t, e);
                })[0];
            }),
            t
        );
    })();
    return (
        (or.defaultOptions = {
            autoHide: !0,
            forceVisible: !1,
            classNames: {
                contentEl: "simplebar-content",
                contentWrapper: "simplebar-content-wrapper",
                offset: "simplebar-offset",
                mask: "simplebar-mask",
                wrapper: "simplebar-wrapper",
                placeholder: "simplebar-placeholder",
                scrollbar: "simplebar-scrollbar",
                track: "simplebar-track",
                heightAutoObserverWrapperEl: "simplebar-height-auto-observer-wrapper",
                heightAutoObserverEl: "simplebar-height-auto-observer",
                visible: "simplebar-visible",
                horizontal: "simplebar-horizontal",
                vertical: "simplebar-vertical",
                hover: "simplebar-hover",
                dragging: "simplebar-dragging",
            },
            scrollbarMinSize: 25,
            scrollbarMaxSize: 0,
            timeout: 1e3,
        }),
        nr && or.initHtmlApi(),
        or
    );
});


// --------------------------------------------- Simple Sidebar js -----------------------------------------  






// --------------------------------------------- Wizard Form ----------------------------------------


(function (e) {
    var n = function (d, k) {
        d = e(d);
        var a = this,
            g = [],
            c = e.extend({}, e.fn.bootstrapWizard.defaults, k),
            f = null,
            b = null;
        this.rebindClick = function (h, a) {
            h.unbind("click", a).bind("click", a);
        };
        this.fixNavigationButtons = function () {
            f.length || (b.find("a:first").tab("show"), (f = b.find('li:has([data-toggle="tab"]):first')));
            e(c.previousSelector, d).toggleClass("disabled", a.firstIndex() >= a.currentIndex());
            e(c.nextSelector, d).toggleClass("disabled", a.currentIndex() >= a.navigationLength());
            e(c.backSelector, d).toggleClass("disabled", 0 == g.length);
            a.rebindClick(e(c.nextSelector, d), a.next);
            a.rebindClick(e(c.previousSelector, d), a.previous);
            a.rebindClick(e(c.lastSelector, d), a.last);
            a.rebindClick(e(c.firstSelector, d), a.first);
            a.rebindClick(e(c.backSelector, d), a.back);
            if (c.onTabShow && "function" === typeof c.onTabShow && !1 === c.onTabShow(f, b, a.currentIndex())) return !1;
        };
        this.next = function (h) {
            if (d.hasClass("last") || (c.onNext && "function" === typeof c.onNext && !1 === c.onNext(f, b, a.nextIndex()))) return !1;
            h = a.currentIndex();
            $index = a.nextIndex();
            $index > a.navigationLength() || (g.push(h), b.find('li:has([data-toggle="tab"]):eq(' + $index + ") a").tab("show"));
        };
        this.previous = function (h) {
            if (d.hasClass("first") || (c.onPrevious && "function" === typeof c.onPrevious && !1 === c.onPrevious(f, b, a.previousIndex()))) return !1;
            h = a.currentIndex();
            $index = a.previousIndex();
            0 > $index || (g.push(h), b.find('li:has([data-toggle="tab"]):eq(' + $index + ") a").tab("show"));
        };
        this.first = function (h) {
            if ((c.onFirst && "function" === typeof c.onFirst && !1 === c.onFirst(f, b, a.firstIndex())) || d.hasClass("disabled")) return !1;
            g.push(a.currentIndex());
            b.find('li:has([data-toggle="tab"]):eq(0) a').tab("show");
        };
        this.last = function (h) {
            if ((c.onLast && "function" === typeof c.onLast && !1 === c.onLast(f, b, a.lastIndex())) || d.hasClass("disabled")) return !1;
            g.push(a.currentIndex());
            b.find('li:has([data-toggle="tab"]):eq(' + a.navigationLength() + ") a").tab("show");
        };
        this.back = function () {
            if (0 == g.length) return null;
            var a = g.pop();
            if (c.onBack && "function" === typeof c.onBack && !1 === c.onBack(f, b, a)) return g.push(a), !1;
            d.find('li:has([data-toggle="tab"]):eq(' + a + ") a").tab("show");
        };
        this.currentIndex = function () {
            return b.find('li:has([data-toggle="tab"])').index(f);
        };
        this.firstIndex = function () {
            return 0;
        };
        this.lastIndex = function () {
            return a.navigationLength();
        };
        this.getIndex = function (a) {
            return b.find('li:has([data-toggle="tab"])').index(a);
        };
        this.nextIndex = function () {
            return b.find('li:has([data-toggle="tab"])').index(f) + 1;
        };
        this.previousIndex = function () {
            return b.find('li:has([data-toggle="tab"])').index(f) - 1;
        };
        this.navigationLength = function () {
            return b.find('li:has([data-toggle="tab"])').length - 1;
        };
        this.activeTab = function () {
            return f;
        };
        this.nextTab = function () {
            return b.find('li:has([data-toggle="tab"]):eq(' + (a.currentIndex() + 1) + ")").length ? b.find('li:has([data-toggle="tab"]):eq(' + (a.currentIndex() + 1) + ")") : null;
        };
        this.previousTab = function () {
            return 0 >= a.currentIndex() ? null : b.find('li:has([data-toggle="tab"]):eq(' + parseInt(a.currentIndex() - 1) + ")");
        };
        this.show = function (b) {
            b = isNaN(b) ? d.find('li:has([data-toggle="tab"]) a[href=#' + b + "]") : d.find('li:has([data-toggle="tab"]):eq(' + b + ") a");
            0 < b.length && (g.push(a.currentIndex()), b.tab("show"));
        };
        this.disable = function (a) {
            b.find('li:has([data-toggle="tab"]):eq(' + a + ")").addClass("disabled");
        };
        this.enable = function (a) {
            b.find('li:has([data-toggle="tab"]):eq(' + a + ")").removeClass("disabled");
        };
        this.hide = function (a) {
            b.find('li:has([data-toggle="tab"]):eq(' + a + ")").hide();
        };
        this.display = function (a) {
            b.find('li:has([data-toggle="tab"]):eq(' + a + ")").show();
        };
        this.remove = function (a) {
            var c = "undefined" != typeof a[1] ? a[1] : !1;
            a = b.find('li:has([data-toggle="tab"]):eq(' + a[0] + ")");
            c && ((c = a.find("a").attr("href")), e(c).remove());
            a.remove();
        };
        var l = function (d) {
                var g = b.find('li:has([data-toggle="tab"])');
                d = g.index(e(d.currentTarget).parent('li:has([data-toggle="tab"])'));
                g = e(g[d]);
                if (c.onTabClick && "function" === typeof c.onTabClick && !1 === c.onTabClick(f, b, a.currentIndex(), d, g)) return !1;
            },
            m = function (d) {
                $element = e(d.target).parent();
                d = b.find('li:has([data-toggle="tab"])').index($element);
                if ($element.hasClass("disabled") || (c.onTabChange && "function" === typeof c.onTabChange && !1 === c.onTabChange(f, b, a.currentIndex(), d))) return !1;
                f = $element;
                a.fixNavigationButtons();
            };
        this.resetWizard = function () {
            e('a[data-toggle="tab"]', b).off("click", l);
            e('a[data-toggle="tab"]', b).off("shown shown.bs.tab", m);
            b = d.find("ul:first", d);
            f = b.find('li:has([data-toggle="tab"]).active', d);
            e('a[data-toggle="tab"]', b).on("click", l);
            e('a[data-toggle="tab"]', b).on("shown shown.bs.tab", m);
            a.fixNavigationButtons();
        };
        b = d.find("ul:first", d);
        f = b.find('li:has([data-toggle="tab"]).active', d);
        b.hasClass(c.tabClass) || b.addClass(c.tabClass);
        if (c.onInit && "function" === typeof c.onInit) c.onInit(f, b, 0);
        if (c.onShow && "function" === typeof c.onShow) c.onShow(f, b, a.nextIndex());
        e('a[data-toggle="tab"]', b).on("click", l);
        e('a[data-toggle="tab"]', b).on("shown shown.bs.tab", m);
    };
    e.fn.bootstrapWizard = function (d) {
        if ("string" == typeof d) {
            var k = Array.prototype.slice.call(arguments, 1);
            1 === k.length && k.toString();
            return this.data("bootstrapWizard")[d](k);
        }
        return this.each(function (a) {
            a = e(this);
            if (!a.data("bootstrapWizard")) {
                var g = new n(a, d);
                a.data("bootstrapWizard", g);
                g.fixNavigationButtons();
            }
        });
    };
    e.fn.bootstrapWizard.defaults = {
        tabClass: "nav nav-pills",
        nextSelector: ".wizard li.next",
        previousSelector: ".wizard li.previous",
        firstSelector: ".wizard li.first",
        lastSelector: ".wizard li.last",
        backSelector: ".wizard li.back",
        onShow: null,
        onInit: null,
        onNext: null,
        onPrevious: null,
        onLast: null,
        onFirst: null,
        onBack: null,
        onTabChange: null,
        onTabClick: null,
        onTabShow: null,
    };
})(jQuery);


// --------------------------------------------- Wizard form end ------------------------------------




// ------------------------------------------- Main App min js --------------------------------------------


!function (n) {
    "use strict";
    function s() {
        for (var e = document.getElementById("topnav-menu-content").getElementsByTagName("a"), t = 0, n = e.length; t < n; t++) "nav-item dropdown active" === e[t].parentElement.getAttribute("class") && (e[t].parentElement.classList.remove("active"),
            e[t].nextElementSibling.classList.remove("show"));
    }
    function t(e) {
        //console.log(sessionStorage.getItem("is_visited"));
        if (n("#light-mode-switch").prop("checked") && "light-mode-switch" === e || sessionStorage.getItem("is_visited")=== "light-mode-switch"){
            console.log("lighe mode is checked =>>>.");
            (n("html").removeAttr("dir"),
            n("#bootstrap-style").attr("href", "assets/css/bootstrap.min.css"), n("#app-style").attr("href", "assets/css/app.min.css"),
            sessionStorage.setItem("is_visited", "light-mode-switch"))

        }
        if (!n("#light-mode-switch").prop("checked") && "light-mode-switch" === e || sessionStorage.getItem("is_visited")=== "dark-mode-switch"  ){
            //console.log("lighe mode is not checked");
            (n("html").removeAttr("dir"),
                n("#bootstrap-style").attr("href", "assets/css/bootstrap-dark.min.css"), n("#app-style").attr("href", "assets/css/app-dark.min.css"),
                 sessionStorage.setItem("is_visited", "dark-mode-switch"))
         }
        
    }
    function e() {
        document.webkitIsFullScreen || document.mozFullScreen || document.msFullscreenElement || (console.log("pressed"),
            n("body").removeClass("fullscreen-enable"));
    }
    var a;
    n("#side-menu").metisMenu(), n("#vertical-menu-btn").on("click", function (e) {
        e.preventDefault(), n("body").toggleClass("sidebar-enable"), 992 >= n(window).width() ? n("body").toggleClass("vertical-collpsed") : n("body").removeClass("vertical-collpsed");
    }), n("body,html").click(function (e) {
        var t = n("#vertical-menu-btn");
        t.is(e.target) || 0 !== t.has(e.target).length || e.target.closest("div.vertical-menu") || n("body").removeClass("sidebar-enable");
    }), n("#sidebar-menu a").each(function () {
        var e = window.location.href.split(/[?#]/)[0];
        this.href == e && (n(this).addClass("active"), n(this).parent().addClass("mm-active"),
            n(this).parent().parent().addClass("mm-show"), n(this).parent().parent().prev().addClass("mm-active"),
            n(this).parent().parent().parent().addClass("mm-active"), n(this).parent().parent().parent().parent().addClass("mm-show"),
            n(this).parent().parent().parent().parent().parent().addClass("mm-active"));
    }), n(".navbar-nav a").each(function () {
        var e = window.location.href.split(/[?#]/)[0];
        this.href == e && (n(this).addClass("active"), n(this).parent().addClass("active"),
            n(this).parent().parent().addClass("active"), n(this).parent().parent().parent().addClass("active"),
            n(this).parent().parent().parent().parent().addClass("active"), n(this).parent().parent().parent().parent().parent().addClass("active"));
    }), n(document).ready(function () {
        var e;
        0 < n("#sidebar-menu").length && 0 < n("#sidebar-menu .mm-active .active").length && (300 < (e = n("#sidebar-menu .mm-active .active").offset().top) && (e -= 300,
            n(".vertical-menu .simplebar-content-wrapper").animate({
                scrollTop: e
            }, "slow")));
    }), n('[data-toggle="fullscreen"]').on("click", function (e) {
        e.preventDefault(), n("body").toggleClass("fullscreen-enable"), document.fullscreenElement || document.mozFullScreenElement || document.webkitFullscreenElement ? document.cancelFullScreen ? document.cancelFullScreen() : document.mozCancelFullScreen ? document.mozCancelFullScreen() : document.webkitCancelFullScreen && document.webkitCancelFullScreen() : document.documentElement.requestFullscreen ? document.documentElement.requestFullscreen() : document.documentElement.mozRequestFullScreen ? document.documentElement.mozRequestFullScreen() : document.documentElement.webkitRequestFullscreen && document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
    }), document.addEventListener("fullscreenchange", e), document.addEventListener("webkitfullscreenchange", e),
        document.addEventListener("mozfullscreenchange", e), n(".right-bar-toggle").on("click", function (e) {
            n("body").toggleClass("right-bar-enabled");
        }), n(".right-bar-toggle1").on("click", function (e) {
            n("body").toggleClass("right-bar-enabled1");
        }), n(document).on("click", "body", function (e) {
            0 < n(e.target).closest(".right-bar-toggle, .right-bar").length || n("body").removeClass("right-bar-enabled");
        }), n(document).on("click", "body", function (e) {
            0 < n(e.target).closest(".right-bar-toggle1, .right-bar1").length || n("body").removeClass("right-bar-enabled1");
        }), function () {
            if (document.getElementById("topnav-menu-content")) {
                for (var e = document.getElementById("topnav-menu-content").getElementsByTagName("a"), t = 0, n = e.length; t < n; t++) e[t].onclick = function (e) {
                    "#" === e.target.getAttribute("href") && (e.target.parentElement.classList.toggle("active"),
                        e.target.nextElementSibling.classList.toggle("show"));
                };
                window.addEventListener("resize", s);
            }
        }(), [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]')).map(function (e) {
            return new bootstrap.Tooltip(e);
        }), [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]')).map(function (e) {
            return new bootstrap.Popover(e);
        }), n(".toggle-search").on("click", function () {
            var e = n(this).data("target");
            e && n(e).toggleClass("open");
        }), n(window).on("load", function () {
            n("#status").fadeOut(), n("#preloader").delay(350).fadeOut("slow");
        }), window.sessionStorage && ((a = sessionStorage.getItem("is_visited")) ? (n(".right-bar input:checkbox").prop("checked", !1),
            n("#" + a).prop("checked", !0), t(a)) : sessionStorage.setItem("is_visited", "light-mode-switch")),
        n("#light-mode-switch, #dark-mode-switch, #rtl-mode-switch").on("change", function (e) {
            t(e.target.id);
        }), Waves.init();
}(jQuery);


// ------------------------------------------- Main App min js End ----------------------------------------


