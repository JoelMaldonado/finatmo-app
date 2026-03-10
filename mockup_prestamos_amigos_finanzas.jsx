export default function MockupPrestamosAmigos() {
  const friends = [
    {
      id: 1,
      name: "Harold",
      totalDebt: 5000,
      totalPaid: 4000,
      totalToCollect: 6000,
      nextPayment: 1200,
      nextMonth: "Agosto 2026",
      items: [
        {
          title: "Macbook Air",
          amount: 3200,
          installments: 10,
          startMonth: "Marzo 2026",
          monthlyAmount: 300,
          paid: 3000,
          status: "Activo",
        },
        {
          title: "Apple Watch",
          amount: 1460,
          installments: 8,
          startMonth: "Marzo 2026",
          monthlyAmount: 200,
          paid: 1400,
          status: "Activo",
        },
        {
          title: "Bicicleta",
          amount: 1800,
          installments: 3,
          startMonth: "Agosto 2026",
          monthlyAmount: 600,
          paid: 0,
          status: "Programado",
        },
        {
          title: "Polo Nike",
          amount: 200,
          installments: 2,
          startMonth: "Agosto 2026",
          monthlyAmount: 100,
          paid: 0,
          status: "Programado",
        },
      ],
      timeline: [
        { month: "Marzo 2026", amount: 755 },
        { month: "Abril 2026", amount: 500 },
        { month: "Mayo 2026", amount: 500 },
        { month: "Junio 2026", amount: 500 },
        { month: "Julio 2026", amount: 500 },
        { month: "Agosto 2026", amount: 1200 },
        { month: "Setiembre 2026", amount: 1200 },
        { month: "Octubre 2026", amount: 960 },
        { month: "Noviembre 2026", amount: 570 },
        { month: "Diciembre 2026", amount: 300 },
      ],
    },
    {
      id: 2,
      name: "Jorge",
      totalDebt: 1800,
      totalPaid: 300,
      totalToCollect: 2100,
      nextPayment: 350,
      nextMonth: "Abril 2026",
      items: [
        {
          title: "Televisor",
          amount: 1500,
          installments: 5,
          startMonth: "Abril 2026",
          monthlyAmount: 300,
          paid: 300,
          status: "Activo",
        },
        {
          title: "Zapatos",
          amount: 300,
          installments: 2,
          startMonth: "Mayo 2026",
          monthlyAmount: 150,
          paid: 0,
          status: "Programado",
        },
      ],
      timeline: [
        { month: "Abril 2026", amount: 350 },
        { month: "Mayo 2026", amount: 450 },
        { month: "Junio 2026", amount: 300 },
        { month: "Julio 2026", amount: 300 },
        { month: "Agosto 2026", amount: 300 },
      ],
    },
  ];

  const activeFriend = friends[0];

  const money = (value) => `S/ ${value.toLocaleString("es-PE", { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;

  return (
    <div className="min-h-screen bg-slate-100 p-6">
      <div className="mx-auto max-w-7xl space-y-8">
        <div>
          <h1 className="text-3xl font-bold tracking-tight text-slate-900">Mockups · Préstamos a amigos</h1>
          <p className="mt-2 text-sm text-slate-600">
            Flujo propuesto: listado de amigos → detalle del amigo → registrar nueva compra/deuda.
          </p>
        </div>

        <div className="grid gap-8 xl:grid-cols-3">
          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-slate-200">
            <div className="mb-5 flex items-center justify-between">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Pantalla 1</p>
                <h2 className="text-xl font-bold text-slate-900">Amigos</h2>
              </div>
              <button className="rounded-2xl bg-slate-900 px-4 py-2 text-sm font-medium text-white">+ Nuevo amigo</button>
            </div>

            <div className="mb-4 rounded-2xl bg-slate-50 p-3 ring-1 ring-slate-200">
              <input
                className="w-full bg-transparent text-sm outline-none"
                value="Buscar amigo..."
                readOnly
              />
            </div>

            <div className="space-y-4">
              {friends.map((friend) => (
                <div
                  key={friend.id}
                  className={`rounded-3xl p-4 shadow-sm ring-1 ${friend.id === 1 ? "bg-slate-900 text-white ring-slate-900" : "bg-white text-slate-900 ring-slate-200"}`}
                >
                  <div className="flex items-start justify-between gap-4">
                    <div>
                      <h3 className="text-lg font-bold">{friend.name}</h3>
                      <p className={`mt-1 text-xs ${friend.id === 1 ? "text-slate-300" : "text-slate-500"}`}>
                        Próximo cobro: {friend.nextMonth}
                      </p>
                    </div>
                    <span className={`rounded-full px-3 py-1 text-xs font-semibold ${friend.id === 1 ? "bg-white/15 text-white" : "bg-emerald-100 text-emerald-700"}`}>
                      {money(friend.nextPayment)}
                    </span>
                  </div>

                  <div className="mt-4 grid grid-cols-2 gap-3 text-sm">
                    <div className={`rounded-2xl p-3 ${friend.id === 1 ? "bg-white/10" : "bg-slate-50"}`}>
                      <p className={`text-xs ${friend.id === 1 ? "text-slate-300" : "text-slate-500"}`}>Deuda base</p>
                      <p className="mt-1 font-bold">{money(friend.totalDebt)}</p>
                    </div>
                    <div className={`rounded-2xl p-3 ${friend.id === 1 ? "bg-white/10" : "bg-slate-50"}`}>
                      <p className={`text-xs ${friend.id === 1 ? "text-slate-300" : "text-slate-500"}`}>Total cancelado</p>
                      <p className="mt-1 font-bold">{money(friend.totalPaid)}</p>
                    </div>
                    <div className={`col-span-2 rounded-2xl p-3 ${friend.id === 1 ? "bg-blue-500/20" : "bg-blue-50"}`}>
                      <p className={`text-xs ${friend.id === 1 ? "text-blue-100" : "text-blue-700"}`}>Total a cobrar</p>
                      <p className="mt-1 text-lg font-bold">{money(friend.totalToCollect)}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-slate-200 xl:col-span-1">
            <div className="mb-5 flex items-center justify-between">
              <div>
                <p className="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Pantalla 2</p>
                <h2 className="text-xl font-bold text-slate-900">Detalle de {activeFriend.name}</h2>
              </div>
              <button className="rounded-2xl bg-blue-600 px-4 py-2 text-sm font-medium text-white">+ Nueva compra</button>
            </div>

            <div className="grid gap-3 sm:grid-cols-3">
              <div className="rounded-2xl bg-slate-50 p-4 ring-1 ring-slate-200">
                <p className="text-xs text-slate-500">Deuda base</p>
                <p className="mt-2 text-lg font-bold text-slate-900">{money(activeFriend.totalDebt)}</p>
              </div>
              <div className="rounded-2xl bg-slate-50 p-4 ring-1 ring-slate-200">
                <p className="text-xs text-slate-500">Cancelado</p>
                <p className="mt-2 text-lg font-bold text-slate-900">{money(activeFriend.totalPaid)}</p>
              </div>
              <div className="rounded-2xl bg-slate-900 p-4 text-white">
                <p className="text-xs text-slate-300">Pendiente por cobrar</p>
                <p className="mt-2 text-lg font-bold">{money(activeFriend.totalToCollect - activeFriend.totalPaid)}</p>
              </div>
            </div>

            <div className="mt-5 rounded-3xl bg-slate-50 p-4 ring-1 ring-slate-200">
              <div className="mb-3 flex items-center justify-between">
                <h3 className="font-semibold text-slate-900">Calendario de cobros</h3>
                <span className="text-xs text-slate-500">Historial mensual</span>
              </div>
              <div className="space-y-2">
                {activeFriend.timeline.map((item) => (
                  <div key={item.month} className="flex items-center justify-between rounded-2xl bg-white px-3 py-2 text-sm ring-1 ring-slate-200">
                    <span className="text-slate-600">{item.month}</span>
                    <span className="font-semibold text-slate-900">{money(item.amount)}</span>
                  </div>
                ))}
              </div>
            </div>

            <div className="mt-5">
              <div className="mb-3 flex items-center justify-between">
                <h3 className="font-semibold text-slate-900">Compras / préstamos</h3>
                <button className="text-sm font-medium text-blue-600">Ver tabla completa</button>
              </div>
              <div className="space-y-3">
                {activeFriend.items.map((item) => (
                  <div key={item.title} className="rounded-3xl border border-slate-200 p-4">
                    <div className="flex items-start justify-between gap-4">
                      <div>
                        <h4 className="font-semibold text-slate-900">{item.title}</h4>
                        <p className="mt-1 text-xs text-slate-500">
                          {item.installments} cuotas · empieza en {item.startMonth}
                        </p>
                      </div>
                      <span className={`rounded-full px-3 py-1 text-xs font-semibold ${item.status === "Activo" ? "bg-emerald-100 text-emerald-700" : "bg-amber-100 text-amber-700"}`}>
                        {item.status}
                      </span>
                    </div>

                    <div className="mt-4 grid grid-cols-3 gap-3 text-sm">
                      <div className="rounded-2xl bg-slate-50 p-3">
                        <p className="text-xs text-slate-500">Monto</p>
                        <p className="mt-1 font-semibold text-slate-900">{money(item.amount)}</p>
                      </div>
                      <div className="rounded-2xl bg-slate-50 p-3">
                        <p className="text-xs text-slate-500">Cuota mensual</p>
                        <p className="mt-1 font-semibold text-slate-900">{money(item.monthlyAmount)}</p>
                      </div>
                      <div className="rounded-2xl bg-slate-50 p-3">
                        <p className="text-xs text-slate-500">Pagado</p>
                        <p className="mt-1 font-semibold text-slate-900">{money(item.paid)}</p>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </section>

          <section className="rounded-3xl bg-white p-5 shadow-sm ring-1 ring-slate-200">
            <div className="mb-5">
              <p className="text-xs font-semibold uppercase tracking-[0.2em] text-slate-500">Pantalla 3</p>
              <h2 className="text-xl font-bold text-slate-900">Registrar nueva compra</h2>
              <p className="mt-1 text-sm text-slate-500">Formulario para añadir una deuda nueva al amigo seleccionado.</p>
            </div>

            <div className="space-y-4">
              <Field label="Amigo" value="Harold" />
              <Field label="Título de la compra" value="Polo Adidas" />
              <Field label="Monto prestado" value="S/ 240.00" />
              <div className="grid grid-cols-2 gap-4">
                <Field label="Cantidad de cuotas" value="4" />
                <Field label="Empieza a pagar" value="Agosto 2026" />
              </div>
              <div className="grid grid-cols-2 gap-4">
                <Field label="Interés / ganancia" value="S/ 40.00" />
                <Field label="Cuota calculada" value="S/ 70.00" />
              </div>
              <Field label="Notas" value="Pagará junto con la bicicleta hasta diciembre" multiline />
            </div>

            <div className="mt-5 rounded-3xl bg-blue-50 p-4 ring-1 ring-blue-100">
              <h3 className="font-semibold text-blue-900">Vista previa automática</h3>
              <div className="mt-3 space-y-2 text-sm text-blue-950">
                <div className="flex items-center justify-between rounded-2xl bg-white px-3 py-2 ring-1 ring-blue-100">
                  <span>Agosto 2026</span>
                  <span className="font-semibold">S/ 70.00</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-white px-3 py-2 ring-1 ring-blue-100">
                  <span>Setiembre 2026</span>
                  <span className="font-semibold">S/ 70.00</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-white px-3 py-2 ring-1 ring-blue-100">
                  <span>Octubre 2026</span>
                  <span className="font-semibold">S/ 70.00</span>
                </div>
                <div className="flex items-center justify-between rounded-2xl bg-white px-3 py-2 ring-1 ring-blue-100">
                  <span>Noviembre 2026</span>
                  <span className="font-semibold">S/ 70.00</span>
                </div>
              </div>
            </div>

            <div className="mt-5 flex gap-3">
              <button className="flex-1 rounded-2xl border border-slate-300 px-4 py-3 text-sm font-medium text-slate-700">Cancelar</button>
              <button className="flex-1 rounded-2xl bg-slate-900 px-4 py-3 text-sm font-medium text-white">Guardar deuda</button>
            </div>
          </section>
        </div>
      </div>
    </div>
  );
}

function Field({ label, value, multiline = false }) {
  return (
    <div>
      <label className="mb-2 block text-sm font-medium text-slate-700">{label}</label>
      {multiline ? (
        <div className="min-h-[96px] rounded-2xl bg-slate-50 px-4 py-3 text-sm text-slate-500 ring-1 ring-slate-200">
          {value}
        </div>
      ) : (
        <div className="rounded-2xl bg-slate-50 px-4 py-3 text-sm text-slate-500 ring-1 ring-slate-200">
          {value}
        </div>
      )}
    </div>
  );
}
