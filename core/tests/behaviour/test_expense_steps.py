from datetime import date
import pytest
from pytest_bdd import scenarios, given, when, then, parsers

from core.expense_service import ExpenseService
from core.in_memory_expense_repository import InMemoryExpenseRepository

scenarios("./expense_management.feature")


@pytest.fixture
def context():
    repo = InMemoryExpenseRepository()
    service = ExpenseService(repo)
    return {"service": service, "db": repo}


@given(parsers.parse("un gestor de gastos vacío"))
def empty_manager(context):
    pass


@given(parsers.parse("un gestor con un gasto de {amount:d} euros"))
def manager_with_one_expense(context, amount):
    context["service"].create_expense(
        title="Gasto inicial", amount=amount, description="", expense_date=date.today()
    )


@when(parsers.parse("añado un gasto de {amount:d} euros llamado {title}"))
def add_expense(context, amount, title):
    context["service"].create_expense(
        title=title, amount=amount, description="", expense_date=date.today()
    )


@when(parsers.parse("actualizo el gasto a {amount:d} euros con id {expense_id:d}"))
def update_expense_amount(context, amount, expense_id):
    context["service"].update_expense(expense_id=expense_id, amount=amount)


@when(parsers.parse("actualizo el gasto con id {expense_id:d} con el titulo {title}"))
def update_expense_title(context, title, expense_id):
    context["service"].update_expense(expense_id=expense_id, title=title)


@when(parsers.parse("elimino el gasto con id {expense_id:d}"))
def remove_expense(context, expense_id):
    context["service"].remove_expense(expense_id)


@then(parsers.parse("el total de dinero gastado debe ser {total:d} euros"))
def check_total(context, total):
    assert context["service"].total_amount() == total


@then(parsers.parse("debe haber {expenses:d} gastos registrados"))
def check_expenses_length(context, expenses):
    total = len(context["db"]._expenses)
    assert expenses == total


@then(parsers.parse("el gasto con id {expense_id:d} debe llamarse {title}"))
def check_expense_title(context, expense_id, title):
    expense = context["db"]._expenses[expense_id - 1]
    assert expense.title == title
